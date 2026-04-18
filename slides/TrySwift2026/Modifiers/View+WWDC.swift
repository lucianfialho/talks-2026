import SwiftUI

struct WWDCStyleTransition: ViewModifier {
    @Environment(\.isPDFExporting) private var isPDFExporting
    @State private var isPresent = false
    var enable: Bool

    private var effectiveIsPresent: Bool { isPDFExporting || isPresent }

    func body(content: Content) -> some View {
        content
            .opacity(effectiveIsPresent ? 1 : 0)
            .offset(y: effectiveIsPresent ? 0 : 44)
            .onAppear {
                if enable, !isPDFExporting {
                    withAnimation(.default.speed(0.45)) {
                        isPresent = true
                    }
                } else {
                    isPresent = true
                }
            }
    }
}

extension View {
    func wwdcStyleTransition(enable: Bool = true) -> some View {
        modifier(WWDCStyleTransition(enable: enable))
    }
}
