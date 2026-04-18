import SlideKit
import SwiftUI

/// A slide that provides a custom liquid glass layer.
protocol LiquidGlassSlide: Slide {
    /// Returns the liquid glass scene configuration for this slide.
    func liquidGlassLayer() -> LiquidGlassScene
}

// MARK: - Preview Support

struct LiquidGlassSlidePreview<S: LiquidGlassSlide>: View {
    let slide: S

    var body: some View {
        SlidePreview {
            ViewSlide {
                ZStack {
                    AnyView(slide)
                        .frame(width: SlideSize.standard16_9.width, height: SlideSize.standard16_9.height)
                    LiquidGlassLayer(scene: slide.liquidGlassLayer())
                }
                .frame(width: SlideSize.standard16_9.width, height: SlideSize.standard16_9.height)
            }
        }
    }
}
