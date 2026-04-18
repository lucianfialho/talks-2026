import SlideKit
import SwiftUI

/// Minimal placeholder slide used by the palestra 01 scaffold until the
/// script from issue #4 lands and each `SlideState` gets its dedicated view.
///
/// Rendered as plain SwiftUI — no `LiquidGlassAnimator` hooks are required
/// because the placeholder has nothing animated yet.
@Slide
struct PlaceholderSlide: LiquidGlassSlide {
    let title: String
    let subtitle: String?

    init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Text(title)
                .font(.system(size: 88, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)

            if let subtitle {
                Text(subtitle)
                    .font(.system(size: 36, weight: .medium))
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .frame(
            width: SlideSize.standard16_9.width,
            height: SlideSize.standard16_9.height
        )
    }

    func liquidGlassLayer() -> LiquidGlassScene {
        LiquidGlassScene(views: {})
    }

    var script: String { "" }
}

#Preview {
    SlidePreview {
        PlaceholderSlide(
            title: "Placeholder",
            subtitle: "⌘← raso   •   ⌘→ fundo"
        )
    }
}
