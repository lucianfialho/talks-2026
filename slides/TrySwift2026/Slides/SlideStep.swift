import SwiftUI

protocol SlideStep: RawRepresentable where RawValue == Int {
    func isAfter(_ step: Self) -> Bool
}

extension SlideStep {
    func isAfter(_ step: Self) -> Bool {
        step.rawValue <= rawValue
    }
}
