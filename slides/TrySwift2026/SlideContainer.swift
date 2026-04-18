import SlideKit
import SwiftUI

@Slide
struct SlideContainer: View {
    @Environment(\.isPDFExporting) private var isPDFExporting
    @Phase var state: SlideState

    var body: some View {
        let slide = slide(for: state)
        ZStack {
            AnyView(slide)
                .frame(width: SlideSize.standard16_9.width, height: SlideSize.standard16_9.height)
            LiquidGlassLayer(id: state.rawValue, scene: slide.liquidGlassLayer())
        }
        .frame(width: SlideSize.standard16_9.width, height: SlideSize.standard16_9.height)
        .animation(isPDFExporting ? nil : .default.speed(0.8), value: state)
        .allowsHitTesting(false)
    }

    var shouldHideIndex: Bool { true }

    var script: String {
        let slide = slide(for: state)
        return slide.script
    }
}

#Preview {
    SlidePreview {
        SlideContainer()
    }
}
