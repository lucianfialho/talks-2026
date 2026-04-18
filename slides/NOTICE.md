# Attribution — `talks-2026/slides/`

The Swift slides app in this directory builds on top of open-source work by
Junnosuke Matsumoto ([@mtj0928](https://github.com/mtj0928)).

## Primary dependency — SlideKit (MIT)

The slide runtime comes from [SlideKit](https://github.com/mtj0928/SlideKit),
a SwiftUI presentation framework released under the MIT License. SlideKit is
linked as a Swift Package Manager dependency; all types with the `Slide`,
`SlideIndexController`, `SlideSize`, `SlidePresentationMode`, `PhasedState`,
`Slide` macro, `SlidePDFExporter`, `SlideRouterView` names come from it.

Thank you to @mtj0928 and SlideKit contributors for publishing it under MIT.

## Scaffolding inspired by `try-Swift-2026`

The project skeleton and the Liquid Glass visual layer are extracted and
adapted from [try-Swift-2026](https://github.com/mtj0928/try-Swift-2026) —
Junnosuke Matsumoto's talk "Polishing Liquid Glass: Practical Tips for
iOS 26" for try! Swift Tokyo 2026.

Specifically, the following files and directories were copied from that
repository and kept (structurally) intact:

- `slides/TrySwift2026.xcodeproj/` — Xcode project configuration (SPM
  reference to SlideKit, bundle settings, build phases)
- `slides/TrySwift2026/TrySwift2026App.swift` — app entry point scaffold
- `slides/TrySwift2026/SlideContainer.swift` — slide routing container
- `slides/TrySwift2026/SlideConfiguration.swift` — slide configuration stub
- `slides/TrySwift2026/PDFExporter.swift` — PDF export wrapper
- `slides/TrySwift2026/Slides/SlideStep.swift` — `SlideStep` protocol
- `slides/TrySwift2026/Components/` — UI helper components (progress view)
- `slides/TrySwift2026/Modifiers/` — view modifiers (View+WWDC helper)
- `slides/TrySwift2026/LiquidGlass/` — Liquid Glass visual layer (`LiquidGlassSlide`
  protocol, `LiquidGlassLayer`, `LiquidGlassAnimator`, `LiquidGlassScene`,
  `LiquidGlassView`, `LiquidGlassBuilders`)

The `try-Swift-2026` repository does not ship a LICENSE file at the time of
extraction (2026-04-18, commit viewed via `gh api`). Use here is non-commercial,
for the author of this repo's talks (palestras 01–03) only. If the upstream
author objects to any file being included, it can be replaced or re-implemented
on request — please open an issue at
<https://github.com/lucianfialho/talks-2026/issues>.

## What is NOT from upstream

- All `SlideState.swift` content (enum and `slide(for:)` routing) is rewritten
  for the palestras in this repo
- `Slides/Talks/01-Ecommerce/` and everything inside it is original
- `NOTICE.md`, `README.md`, `CLAUDE.md` at the repo root are original
- The video assets (`Wave-1.mov`, `iPhone13-mini_more*.mov`) and the
  image assets (`matsuji.imageset`, `tahoe.imageset`,
  `trySwift_riko_tokyo.imageset`, `Section2/`, `Section3/`,
  `invalidItem.imageset`) from the upstream talk have been removed —
  they were content specific to the try! Swift Tokyo session and do not
  belong in this fork

## Contact

If any attribution above needs correcting, please reach out via a GitHub
issue on <https://github.com/lucianfialho/talks-2026>.
