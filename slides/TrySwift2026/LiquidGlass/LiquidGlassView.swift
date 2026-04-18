import SwiftUI

struct LiquidGlassView: Identifiable {
    var id: Int { index }
    var index: Int
    var alignment: Alignment = .center
    var size: Size?
    var padding: EdgeInsets = .init()
    var offset: CGSize = .zero
    var shape: GlassShape = .rect
    var scale: CGFloat = 1.0
    var material: GlassMaterial = .clear
    var animation: Animation? = .default.speed(0.8)
    var endGlassTransition: EndGlassTransition?
    var childIDs: [Int] = []
    var startChildren: [StartChild] = []
    var content: () -> any View

    /// `startChildren`に含まれるIDの一覧
    var startChildIDs: [Int] {
        startChildren.map(\.id)
    }

    struct Size {
        var width: CGFloat?
        var height: CGFloat?
    }

    // MARK: - Modifiers

    func alignment(_ alignment: Alignment) -> Self {
        var copy = self
        copy.alignment = alignment
        return copy
    }

    func size(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        var copy = self
        copy.size = Size(width: width, height: height)
        return copy
    }

    func padding(_ insets: EdgeInsets) -> Self {
        var copy = self
        copy.padding += insets
        return copy
    }

    func padding(_ edges: Edge.Set = .all, _ length: CGFloat) -> Self {
        var copy = self
        if edges.contains(.top) { copy.padding.top += length }
        if edges.contains(.bottom) { copy.padding.bottom += length }
        if edges.contains(.leading) { copy.padding.leading += length }
        if edges.contains(.trailing) { copy.padding.trailing += length }
        return copy
    }

    func padding(_ length: CGFloat) -> Self {
        padding(.all, length)
    }

    func offset(_ offset: CGSize) -> Self {
        var copy = self
        copy.offset = offset
        return copy
    }

    func offset(x: CGFloat = 0, y: CGFloat = 0) -> Self {
        var copy = self
        copy.offset = CGSize(width: x, height: y)
        return copy
    }

    func shape(_ shape: GlassShape) -> Self {
        var copy = self
        copy.shape = shape
        return copy
    }

    func material(_ material: GlassMaterial) -> Self {
        var copy = self
        copy.material = material
        return copy
    }

    func animation(_ animation: Animation?) -> Self {
        var copy = self
        copy.animation = animation
        return copy
    }

    func endGlass(_ transition: EndGlassTransition? = .materialize) -> Self {
        var copy = self
        copy.endGlassTransition = transition
        return copy
    }

    func scale(_ scale: CGFloat) -> Self {
        var copy = self
        copy.scale = scale
        return copy
    }

    func childIDs(_ childIDs: [Int]) -> Self {
        var copy = self
        copy.childIDs = childIDs
        return copy
    }

    func startChildIDs(_ startChildren: [StartChild]) -> Self {
        var copy = self
        copy.startChildren = startChildren
        return copy
    }
}

/// `startChildIDs`で指定する子ビューの設定
///
/// `ExpressibleByIntegerLiteral`に準拠しているため、
/// `.startChildIDs([1, 2])`のようにIDだけの指定も可能。
struct StartChild: ExpressibleByIntegerLiteral {
    var id: Int
    var shape: GlassShape?
    var scale: CGFloat?

    init(integerLiteral value: Int) {
        self.id = value
    }

    init(id: Int, shape: GlassShape? = nil, scale: CGFloat? = nil) {
        self.id = id
        self.shape = shape
        self.scale = scale
    }
}

/// endGlass時に使用するトランジションの種類
enum EndGlassTransition {
    case materialize
    case identity
}

extension Optional where Wrapped == EndGlassTransition {
    var glassEffectTransition: GlassEffectTransition {
        switch self {
        case .none: .matchedGeometry
        case .materialize: .materialize
        case .identity: .identity
        }
    }
}

/// Glass effectの種類
enum GlassMaterial {
    case regular
    case clear
    case identity

    var glassEffect: SwiftUI.Glass {
        switch self {
        case .regular: .regular
        case .clear: .clear
        case .identity: .identity
        }
    }
}

/// Glass effectに適用するShape
enum GlassShape {
    case rect
    case roundRect(cornerRadius: CGFloat)
    case circle
    case capsule
}

/// `GlassShape`に対応するAnimatable対応の`Shape`
///
/// 各`GlassShape`を固定cornerRadiusとサイズ比例の割合に分解し、
/// SwiftUIのアニメーションシステムで滑らかに補間する。
struct GlassShapeView: Shape, Animatable {
    private var cornerRadius: CGFloat
    private var proportionalFraction: CGFloat

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { .init(cornerRadius, proportionalFraction) }
        set {
            cornerRadius = newValue.first
            proportionalFraction = newValue.second
        }
    }

    init(glassShape: GlassShape) {
        switch glassShape {
        case .rect:
            self.cornerRadius = 0
            self.proportionalFraction = 0
        case .roundRect(let radius):
            self.cornerRadius = radius
            self.proportionalFraction = 0
        case .circle, .capsule:
            self.cornerRadius = 0
            self.proportionalFraction = 1
        }
    }

    func path(in rect: CGRect) -> Path {
        let maxRadius = min(rect.width, rect.height) / 2
        let effectiveRadius = cornerRadius + (maxRadius - cornerRadius) * proportionalFraction
        return RoundedRectangle(cornerRadius: effectiveRadius).path(in: rect)
    }
}
