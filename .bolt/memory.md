# Project memory

## Product intent & audience

- Project: “Finfet-NAND2Sync-Counter” by XEMAC — static GitHub Pages site
- Purpose: GitHub project showcase + quick technical revision guide
- Audience: reviewers/recruiters scanning a project, and students/engineers revising the counter chain

## Brand personality & voice

- Technical, concise, evidence-led; avoids marketing or narrative prose
- Descriptions are short stage-by-stage explanations with formulas

## Visual design & UX direction

- Palette: charcoal background; cyan wiring accents; restrained green/yellow for verification stats
- Typography: Space Grotesk (headings), DM Sans (body)
- Light/dark theme toggle included
- No hero banner or project story — leads with large, uncropped NAND physical layout + verification results
- Fixed sidebar section navigation with scroll-spy highlighting; collapses on tablet; grids stack on mobile
- Stage navigation tabs: NAND → D latch → master–slave DFF → T flip-flop → synchronous 4-bit counter; each shows original schematic + description + formula
- Waveform comparison: dropdown across six circuits; schematic vs extracted-view simulations side by side
- Keyboard-accessible image zoom dialog (Enter/Space open, Escape close, focus return)
- Collapsible lab notes: DRC/LVS debug screenshots, simulation setup, README links
- Respect `prefers-reduced-motion` (disable transitions/animations)

## Decisions, constraints & rationale

- Physical verification covers NAND only: 379 DRC checks, 0 violations, LVS MATCH, 91R/90C parasitics — preserved as original saved evidence
- Devices are SVT
- Do not invent results or claim fresh Cadence verification; show original simulation evidence only
- Relative asset paths compatible with GitHub Pages project subdirectory
- No backend, login, paid dependencies, or deployment; only Google Fonts as external dependency
- Deliver complete reviewable source files (static HTML/CSS/JS)

## Open questions & assumptions

- Assumed repository already contains schematic images, waveform PNGs, layout screenshots, verification files, and model files at referenced relative paths
- Exact section ordering beyond “layout-first” inferred from request; may need confirmation
- Theme toggle default (light vs dark) not explicitly specified