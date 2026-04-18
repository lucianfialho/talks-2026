import Observation

/// LiquidGlassLayer全体にバウンスアニメーションを発火するためのシングルトン
@Observable
final class LiquidGlassAnimator {
    /// 共有インスタンス
    static let shared = LiquidGlassAnimator()

    private(set) var bounceCount = 0

    private var locked = false

    private init() {}

    /// LiquidGlassLayer全体をボヨンとバウンスさせる
    func bounce() {
        if locked {
            return
        }
        locked = true
        bounceCount += 1
        Task {
            try? await Task.sleep(for: .seconds(0.4))
            locked = false
        }
    }
}
