import AppKit
import CoreGraphics
import CoreText
import ImageIO
import SlideKit
import SwiftUI

// MARK: - IsPDFExporting Environment

private struct IsPDFExportingKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var isPDFExporting: Bool {
        get { self[IsPDFExportingKey.self] }
        set { self[IsPDFExportingKey.self] = newValue }
    }
}

extension CGImage {
    /// Returns a JPEG-compressed CGImage with a white background, suitable for embedding in PDF contexts.
    func jpegCompressed(quality: CGFloat) -> CGImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: colorSpace,
            bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
        ) else { return nil }

        // Fill white background, then draw the original image on top.
        context.setFillColor(CGColor(red: 1, green: 1, blue: 1, alpha: 1))
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))

        guard let flattened = context.makeImage() else { return nil }

        let data = NSMutableData()
        guard let destination = CGImageDestinationCreateWithData(data, "public.jpeg" as CFString, 1, nil) else { return nil }
        CGImageDestinationAddImage(destination, flattened, [kCGImageDestinationLossyCompressionQuality: quality] as CFDictionary)
        guard CGImageDestinationFinalize(destination) else { return nil }
        guard let source = CGImageSourceCreateWithData(data, nil) else { return nil }
        return CGImageSourceCreateImageAtIndex(source, 0, nil)
    }
}

/// Exports all slide states as a single A4 PDF with one page per step.
/// Each page has the slide in the upper half and the script in the lower half.
@MainActor
struct PDFExporter {

    static let a4Size = CGSize(width: 595.28, height: 841.89)
    private static let margin: CGFloat = 24

    let slideSize: CGSize

    /// Presents a save panel and exports all slides into a single PDF file.
    func exportAll() {
        let panel = NSSavePanel()
        panel.allowedContentTypes = [.pdf]
        panel.nameFieldStringValue = "TrySwift2026_Slides.pdf"
        panel.prompt = "Export"
        panel.message = "Choose where to save the slide PDF"
        guard panel.runModal() == .OK, let fileURL = panel.url else { return }

        var mediaBox = CGRect(origin: .zero, size: Self.a4Size)
        guard let context = CGContext(fileURL as CFURL, mediaBox: &mediaBox, nil) else { return }

        var rawValue = 0
        while let state = SlideState(rawValue: rawValue) {
            let slideInstance = slide(for: state)
            let slideContentView = ZStack {
                AnyView(slideInstance)
                    .frame(width: slideSize.width, height: slideSize.height)
                LiquidGlassLayer(scene: slideInstance.liquidGlassLayer())
            }
            .frame(width: slideSize.width, height: slideSize.height)
            .clipped()
            .environment(\.isPDFExporting, true)

            let slideRenderer = ImageRenderer(content: slideContentView)
            slideRenderer.scale = 1.5
            if let slideImage = slideRenderer.cgImage,
               let compressedImage = slideImage.jpegCompressed(quality: 0.7) {
                renderPage(slideImage: compressedImage, script: slideInstance.script, in: context)
            }
            rawValue += 1
        }
        context.closePDF()
    }

    private func renderPage(slideImage: CGImage, script: String, in pdfContext: CGContext) {
        let topHalfHeight = Self.a4Size.height / 2

        let options: [CFString: Any] = [
            kCGPDFContextMediaBox: CGRect(origin: .zero, size: Self.a4Size)
        ]
        pdfContext.beginPDFPage(options as CFDictionary)

        // -- Slide image (top half, aspect fit) --
        let imageAspect = CGFloat(slideImage.width) / CGFloat(slideImage.height)
        let availableWidth = Self.a4Size.width - Self.margin * 2
        let availableHeight = topHalfHeight - Self.margin * 2
        let fitSize: CGSize = if imageAspect > availableWidth / availableHeight {
            CGSize(width: availableWidth, height: availableWidth / imageAspect)
        } else {
            CGSize(width: availableHeight * imageAspect, height: availableHeight)
        }
        let imageX = (Self.a4Size.width - fitSize.width) / 2
        let imageY = topHalfHeight + (topHalfHeight - fitSize.height) / 2
        pdfContext.draw(slideImage, in: CGRect(origin: CGPoint(x: imageX, y: imageY), size: fitSize))

        // -- Divider --
        pdfContext.setStrokeColor(CGColor(gray: 0.5, alpha: 0.3))
        pdfContext.setLineWidth(0.5)
        pdfContext.move(to: CGPoint(x: Self.margin, y: topHalfHeight))
        pdfContext.addLine(to: CGPoint(x: Self.a4Size.width - Self.margin, y: topHalfHeight))
        pdfContext.strokePath()

        // -- Script text (bottom half, vector) --
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont.systemFont(ofSize: 12, weight: .bold),
            .foregroundColor: NSColor.gray,
        ]
        let bodyAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont.systemFont(ofSize: 11),
            .foregroundColor: NSColor.black,
        ]
        let fullText = NSMutableAttributedString(string: "Script\n", attributes: titleAttributes)
        fullText.append(NSAttributedString(string: script, attributes: bodyAttributes))

        let textRect = CGRect(
            x: Self.margin,
            y: Self.margin,
            width: Self.a4Size.width - Self.margin * 2,
            height: topHalfHeight - Self.margin * 2
        )
        let framesetter = CTFramesetterCreateWithAttributedString(fullText)
        let path = CGPath(rect: textRect, transform: nil)
        let frame = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: fullText.length), path, nil)
        CTFrameDraw(frame, pdfContext)

        pdfContext.endPDFPage()
    }
}
