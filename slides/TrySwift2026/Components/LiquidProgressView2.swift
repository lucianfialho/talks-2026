//


import SwiftUI

// MARK: - LiquidProgressView

struct LiquidProgressView: View {
    enum State: Equatable {
        case idle
        case loading
        case completed
    }
    
    @Binding var progress: CGFloat
    @Binding var state: State
    var onTap: (() -> Void)?
    var onSizeChange: ((CGSize) -> Void)?
    
    var body: some View {
        ZStack {
            switch state {
            case .idle:
                IdleView(onTap: onTap)
            case .loading:
                LoadingView(progress: progress)
            case .completed:
                CompletedView()
            }
        }
        .clipShape(Capsule())
        .contentShape(Capsule())
    }
}

// MARK: - DesignGuide

extension LiquidProgressView {
    enum DesignGuide {
        static let compactSize = CGSize(width: 44, height: 44)
        static let loadingSize = CGSize(width: 100, height: 44)
        static let labelFontSize: CGFloat = 12
        static let iconInset: CGFloat = 8
        static let iconSize: CGFloat = 44 - 2 * iconInset
    }
}

// MARK: - IdleView

private struct IdleView: View {
    var onTap: (() -> Void)?
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            Color(.gray)
                .overlay {
                    Image(systemName: "arrow.down.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: LiquidProgressView.DesignGuide.iconSize,
                            height: LiquidProgressView.DesignGuide.iconSize
                        )
                        .foregroundStyle(.primary)
                }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - LoadingView

struct LoadingView: View {
    let progress: CGFloat
    var scale: CGFloat = 1

    var body: some View {
        Color.clear
            .overlay(alignment: .leading) {
                WaveProgressView(progress: progress, scale: scale)
            }
            .overlay {
                Text("Loading...")
                    .font(.system(size: LiquidProgressView.DesignGuide.labelFontSize * scale, weight: .bold))
            }
    }
}

// MARK: - WaveProgressView

private struct WaveProgressView: View {
    let progress: CGFloat
    var scale: CGFloat = 1
    
    @State private var wavePhase: CGFloat = 0
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let progressWidth = size.width * progress
                guard progressWidth > 0 else { return }
                
                // Calculate phase based on time (scaled for animation speed)
                let date = timeline.date.timeIntervalSinceReferenceDate
                let phase = CGFloat(date.truncatingRemainder(dividingBy: 10)) * 2 * .pi / (2.5 / 2)

                // Scale amplitude and frequency
                let scaledSecondaryAmplitude = 1.5 * scale
                let scaledSecondaryFrequency = 1.0
                let scaledPrimaryAmplitude = 2.5 * scale
                let scaledPrimaryFrequency = 0.8

                // Draw secondary wave (back layer)
                let secondWavePath = createWavePath(
                    width: progressWidth,
                    height: size.height,
                    amplitude: scaledSecondaryAmplitude,
                    frequency: scaledSecondaryFrequency,
                    phase: -phase
                )
                context.fill(
                    secondWavePath,
                    with: .color(.blue.opacity(0.3))
                )
                
                // Draw primary wave (front layer)
                let primaryWavePath = createWavePath(
                    width: progressWidth,
                    height: size.height,
                    amplitude: scaledPrimaryAmplitude,
                    frequency: scaledPrimaryFrequency,
                    phase: phase
                )
                context.fill(
                    primaryWavePath,
                    with: .color(.blue.opacity(0.6))
                )
            }
        }
    }
    
    private func createWavePath(
        width: CGFloat,
        height: CGFloat,
        amplitude: CGFloat,
        frequency: CGFloat,
        phase: CGFloat
    ) -> Path {
        var path = Path()
        
        // Wave base position - offset from right edge so wave stays within bounds
        let waveBaseX = width - amplitude
        
        // Start from bottom-left
        path.move(to: CGPoint(x: 0, y: height))
        
        // Draw left edge up to top
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        // Draw wave along the right edge (top to bottom)
        for y in stride(from: CGFloat(0), through: height, by: 1) {
            let relativeY = y / height
            let sine = sin(relativeY * .pi * frequency * 2 + phase)
            let x = waveBaseX + sine * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        // Close path back to bottom-left
        path.closeSubpath()
        
        return path
    }
}

// MARK: - CompletedView

private struct CompletedView: View {
    var body: some View {
        Color.gray
            .overlay {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: LiquidProgressView.DesignGuide.iconSize,
                        height: LiquidProgressView.DesignGuide.iconSize
                    )
                    .foregroundStyle(.green)
            }
    }
}

// MARK: - Convenience Methods

extension LiquidProgressView {
    func startLoading() -> LiquidProgressView {
        var copy = self
        copy._state = .constant(.loading)
        copy._progress = .constant(0)
        return copy
    }
}

// MARK: - Preview

#Preview("Idle") {
    LiquidProgressView(
        progress: .constant(0),
        state: .constant(.idle)
    )
    .frame(width: 44, height: 44)
}

#Preview("Loading with Wave") {
    LiquidProgressView(
        progress: .constant(0.6),
        state: .constant(.loading)
    )
    .frame(width: 100, height: 44)
}

#Preview("Completed") {
    LiquidProgressView(
        progress: .constant(1.0),
        state: .constant(.completed)
    )
    .frame(width: 44, height: 44)
}

#Preview("Interactive Demo") {
    InteractiveDemoView()
}

private struct InteractiveDemoView: View {
    @State private var state: LiquidProgressView.State = .idle
    @State private var progress: CGFloat = 0
    @State private var viewSize: CGSize = LiquidProgressView.DesignGuide.compactSize
    @State private var timer: Timer?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                LiquidProgressView(
                    progress: $progress,
                    state: $state,
                    onTap: {
                        startLoading()
                    },
                    onSizeChange: { newSize in
                        withAnimation(.spring(duration: 0.3)) {
                            viewSize = newSize
                        }
                    }
                )
                .frame(width: viewSize.width, height: viewSize.height)
                
                VStack(spacing: 16) {
                    Text("State: \(String(describing: state))")
                    Text("Progress: \(Int(progress * 100))%")
                    
                    Button("Reset") {
                        resetView()
                    }
                    .buttonStyle(.bordered)
                }
            }
            .navigationTitle("LiquidProgressView")
        }
    }
    
    private func startLoading() {
        state = .loading
        progress = 0
        
        // Simulate loading progress
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if progress < 1.0 {
                progress += 0.02
            } else {
                timer?.invalidate()
                timer = nil
                state = .completed
            }
        }
    }
    
    private func resetView() {
        timer?.invalidate()
        timer = nil
        state = .idle
        progress = 0
    }
}

#Preview("In Toolbar") {
    NavigationStack {
        VStack {
            Text("Content")
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                LiquidProgressView(
                    progress: .constant(0.7),
                    state: .constant(.loading)
                )
                .frame(width: 70, height: 44)
            }
        }
    }
}
