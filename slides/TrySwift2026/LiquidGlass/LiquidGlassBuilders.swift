@resultBuilder
enum LiquidGlassViewBuilder {
    static func buildBlock(_ components: [LiquidGlassView]...) -> [LiquidGlassView] {
        components.flatMap { $0 }
    }

    static func buildExpression(_ expression: LiquidGlassView) -> [LiquidGlassView] {
        [expression]
    }

    static func buildOptional(_ component: [LiquidGlassView]?) -> [LiquidGlassView] {
        component ?? []
    }

    static func buildEither(first component: [LiquidGlassView]) -> [LiquidGlassView] {
        component
    }

    static func buildEither(second component: [LiquidGlassView]) -> [LiquidGlassView] {
        component
    }

    static func buildArray(_ components: [[LiquidGlassView]]) -> [LiquidGlassView] {
        components.flatMap { $0 }
    }
}

@resultBuilder
enum LiquidGlassSceneBuilder {
    static func buildBlock(_ components: [LiquidGlassScene]...) -> [LiquidGlassScene] {
        components.flatMap { $0 }
    }

    static func buildExpression(_ expression: LiquidGlassScene) -> [LiquidGlassScene] {
        [expression]
    }

    static func buildOptional(_ component: [LiquidGlassScene]?) -> [LiquidGlassScene] {
        component ?? []
    }

    static func buildEither(first component: [LiquidGlassScene]) -> [LiquidGlassScene] {
        component
    }

    static func buildEither(second component: [LiquidGlassScene]) -> [LiquidGlassScene] {
        component
    }

    static func buildArray(_ components: [[LiquidGlassScene]]) -> [LiquidGlassScene] {
        components.flatMap { $0 }
    }
}
