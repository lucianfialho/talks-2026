import SlideKit
import SwiftUI

/// Slide enum for **Palestra 01 — Como atingir o máximo de eficiência com o Claude Code**.
///
/// Date: 2026-04-25.
///
/// Three depth bifurcations are modeled as sibling states that the presenter
/// jumps between via keyboard shortcuts (⌘← = raso, ⌘→ = fundo). See the
/// talks-2026 root README for the full flow.
enum SlideState: Int, PhasedState {
    static let initial: SlideState = .title

    // MARK: - Abertura
    case title
    case whoIAm
    case stats              // /stats snapshot as prova social
    case howTalkWorks       // URL of the voting site
    case icebreaker         // Bifurcação 0 (ordem, falsa — mesmo caminho)

    // MARK: - Ato 1 — Antes era assim
    case beforeAnalysis
    case problemStatement

    // MARK: - Ato 2 — Primeira automação
    case simpleAutomation
    case bifurcation1         // Quer ver por baixo?
    case automationDeepDive   // (fundo)

    // MARK: - Ato 3 — MMM case
    case mmmIntro
    case mmmStory             // 16h, agente bateu Meridian, trapaceou
    case bifurcation2         // Quer ver código + trapaça?
    case mmmCode              // (fundo)
    case mmmLesson            // Immutable by instruction is not enough

    // MARK: - Ato 4 — Boas práticas
    case bestPractices
    case bifurcation3         // Método técnico (gates) ou princípios?
    case gatesDeepDive        // (fundo)

    // MARK: - Fechamento
    case cta                  // analytics-copilot beta
    case thankYou
}

/// Renders a slide for the given state. For the scaffold phase we return a
/// single `PlaceholderSlide` with the state's title. Each state will be
/// replaced with its own dedicated `LiquidGlassSlide` as the script
/// (issue #4) fills in.
@MainActor
func slide(for state: SlideState) -> any LiquidGlassSlide {
    PlaceholderSlide(
        title: state.displayTitle,
        subtitle: state.depthHint
    )
}

private extension SlideState {
    /// Human-friendly title used by the placeholder while content is being
    /// filled in. Replace per state once the script is ready.
    var displayTitle: String {
        switch self {
        case .title: "Como atingir o máximo de eficiência com o Claude Code"
        case .whoIAm: "Quem sou eu"
        case .stats: "Meus últimos 30 dias com o Claude Code"
        case .howTalkWorks: "Essa palestra é uma aventura"
        case .icebreaker: "Por onde começamos?"
        case .beforeAnalysis: "Antes era assim"
        case .problemStatement: "Quanto tempo você perde?"
        case .simpleAutomation: "Primeira automação"
        case .bifurcation1: "Quer ver como funciona por baixo?"
        case .automationDeepDive: "Sob o capô"
        case .mmmIntro: "Deixei um agente rodando 16 horas"
        case .mmmStory: "O agente bateu o Google Meridian em 32%"
        case .bifurcation2: "Quer ver o código e o momento da trapaça?"
        case .mmmCode: "load_data() retornando o holdout"
        case .mmmLesson: "Immutable by instruction is not enough"
        case .bestPractices: "O que eu faço pra isso funcionar"
        case .bifurcation3: "Método técnico ou só os princípios?"
        case .gatesDeepDive: "Gates: next action can't happen until the gate passes"
        case .cta: "Analytics Copilot — beta"
        case .thankYou: "Obrigado"
        }
    }

    /// Depth hint shown under the title for bifurcation slides — visual cue
    /// to the presenter of where the ⌘← / ⌘→ keyboard shortcuts branch.
    var depthHint: String? {
        switch self {
        case .bifurcation1, .bifurcation2, .bifurcation3:
            "⌘← raso   •   ⌘→ fundo"
        default:
            nil
        }
    }
}
