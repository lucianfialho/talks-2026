import Foundation

struct LiquidGlassSceneGroup {
    var scenes: [LiquidGlassScene]

    init(@LiquidGlassSceneBuilder _ content: () -> [LiquidGlassScene]) {
        self.scenes = content()
    }
}

struct LiquidGlassScene: Identifiable {
    var id: String
    var views: [LiquidGlassView]

    init(
        file: StaticString = #file,
        line: UInt = #line,
        @LiquidGlassViewBuilder views: () -> [LiquidGlassView]
    ) {
        self.id = "\(file):\(line)"
        self.views = views()
    }
}
