import SwiftUI

struct LiquidGlassLayer: View {
    var id: Int = 0
    var scene: LiquidGlassScene

    @Environment(\.isPDFExporting) private var isPDFExporting
    @Namespace private var namespace

    /// Returns the scene's views combined with placeholder views for any child IDs
    /// and start child IDs that are referenced but not present in the scene.
    /// Placeholders copy the parent view's properties but use hidden content.
    /// During PDF export, placeholders are skipped to avoid duplicate rendering.
    private func allViews(in scene: LiquidGlassScene) -> [LiquidGlassView] {
        if isPDFExporting {
            return scene.views
        }

        let existingIDs = Set(scene.views.map(\.id))
        var result = scene.views

        for view in scene.views where !view.childIDs.isEmpty {
            for childID in view.childIDs where !existingIDs.contains(childID) {
                var placeholder = LiquidGlassView(index: childID) {
                    view
                        .content()
                        .hidden()
                }
                placeholder.alignment = view.alignment
                placeholder.size = view.size
                placeholder.padding = view.padding
                placeholder.offset = view.offset
                placeholder.shape = view.shape
                placeholder.material = view.material
                placeholder.animation = view.animation
                result.append(placeholder)
            }
        }

        for view in scene.views where !view.startChildren.isEmpty {
            for startChild in view.startChildren where !existingIDs.contains(startChild.id) {
                var placeholder = LiquidGlassView(index: startChild.id) {
                    view
                        .content()
                        .hidden()
                }
                placeholder.alignment = view.alignment
                placeholder.size = view.size
                placeholder.padding = view.padding
                placeholder.offset = view.offset
                placeholder.shape = startChild.shape ?? view.shape
                placeholder.scale = startChild.scale ?? view.scale
                placeholder.material = view.material
                placeholder.animation = view.animation
                result.append(placeholder)
            }
        }

        return result
    }

    /// Collects all IDs referenced by `startChildren` across the scene.
    private var startChildIDSet: Set<Int> {
        Set(scene.views.flatMap(\.startChildIDs))
    }

    var body: some View {
        GlassEffectContainer(spacing: 65) {
            ZStack {
                ForEach(allViews(in: scene)) { glassView in
                    LiquidGlassItemView(
                        glassView: glassView,
                        namespace: namespace,
                        isStartChild: startChildIDSet.contains(glassView.id),
                        id: id
                    )
                }
            }
        }
    }
}

// MARK: - SubView

private struct LiquidGlassItemView: View {
    var glassView: LiquidGlassView
    var namespace: Namespace.ID
    var isStartChild: Bool = false
    var id: Int

    @Environment(\.isPDFExporting) private var isPDFExporting
    @State private var endGlassTransition: EndGlassTransition?
    @State private var isVisible = false

    @State private var bounceScale: CGFloat = 1.0
    @State private var bounceRotation: Double = 0

    private var effectiveIsVisible: Bool { isPDFExporting || isVisible }

    @ViewBuilder
    private var glassContent: some View {
        let base = ZStack {
            AnyView(glassView.content())
                .hidden()
        }
        .overlay {
            AnyView(glassView.content())
                .matchedGeometryEffect(id: glassView.id.hashValue, in: namespace, properties: .position)
                .id(glassView.id)
        }
        .clipped()
        .scaleEffect(bounceScale, anchor: .topLeading)

        if isPDFExporting {
            base.background(Color(white: 0.9), in: GlassShapeView(glassShape: glassView.shape))
        } else {
            base
                .glassEffectID("glassView.id", in: namespace)
                .glassEffect(
                    glassView.material.glassEffect,
                    in: GlassShapeView(glassShape: glassView.shape)
                )
                .scaleEffect(bounceScale, anchor: .center)
                .glassEffectTransition(endGlassTransition.glassEffectTransition)
        }
    }

    var body: some View {
        VStack {
            if effectiveIsVisible {
                glassContent
                    .frame(width: glassView.size?.width, height: glassView.size?.height)
                    .scaleEffect(glassView.scale)
                    .id(glassView.id.hashValue)
                    .padding(glassView.padding)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: glassView.alignment)
                    .offset(glassView.offset)
                    .onChange(of: glassView.endGlassTransition) { _, newValue in
                        endGlassTransition = newValue
                    }
                    .onChange(of: LiquidGlassAnimator.shared.bounceCount) { _, _ in
                        withAnimation(.spring(duration: 0.15)) {
                            bounceScale = 1.12
                            bounceRotation = 10
                        } completion: {
                            withAnimation(.spring(duration: 0.5, bounce: 0.4)) {
                                bounceScale = 1.0
                                bounceRotation = 0
                            }
                        }
                    }
            }
        }
        .animation(glassView.animation, value: id)
        .task(id: isStartChild) {
            if isPDFExporting {
                isVisible = true
                return
            }
            guard isStartChild else {
                isVisible = true
                return
            }
            isVisible = false
            try? await Task.sleep(for: .seconds(1))
            isVisible = true
        }
    }
}

#Preview {
    LiquidGlassLayer(
        scene: LiquidGlassScene {
            LiquidGlassView(index: 0) {
                Text("Preview")
                    .padding()
                    .fixedSize()
            }
            .shape(.roundRect(cornerRadius: 12))
        }
    )
    .frame(width: 500, height: 320)
}
