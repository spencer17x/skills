---
name: figma-ui
description: Use this skill when implementing UI from a Figma link, Figma screenshot, design mockup, or visual reference. When structured Figma data is available, resolve the linked target and inspect its complete relevant layer hierarchy before planning. Prioritize existing project design tokens and components, then restore the design with high visual fidelity, componentized code, flex-first layouts, and explicit sizing decisions.
---

# Figma UI

## Goal

Implement a Figma design as a front-end page or component with high visual fidelity while preserving the current project's design system, component conventions, and code style.

Use the detailed rules in [`references/implementation-guide.md`](references/implementation-guide.md) when a decision needs more nuance.
For a Figma link, read its **Figma Link and Layer Intake** and
**Layer-to-Implementation Mapping** sections before planning.

## Core Priorities

### Style sources

Use style sources in this order:

1. Existing project design tokens.
2. Existing project theme or CSS variables.
3. Existing component defaults.
4. Figma design tokens.
5. Concrete Figma node values.
6. Visual inference from screenshots only when structured data is unavailable.

Do not start with hardcoded values. Use raw Figma values only when the project has no matching token or when the design intentionally requires a unique value.

### Component sources

Use component sources in this order:

1. Existing project business components.
2. Existing project base UI components.
3. Existing wrapped third-party UI components.
4. New components that match the project conventions.
5. Small local components when reuse is unlikely.

Do not recreate an existing component unless it cannot support the design requirement.

## Required Workflow

Before coding:

1. Determine whether the input provides structured Figma nodes or only a visual
   reference. Do not claim layer coverage when only pixels are available.
2. For structured Figma links, resolve the target node, traverse its complete
   relevant hierarchy, and record unavailable, unresolved, or intentionally
   skipped nodes.
3. Analyze the Figma design: structure, component hierarchy, layout, typography, colors, spacing, assets, states, and responsive variants.
4. Scan the project for tokens, theme files, CSS variables, UI components, shared components, assets, icons, and existing layout patterns.
5. Present an implementation plan with:
   - Input mode and target Figma node.
   - Layer coverage and unresolved references.
   - Layer-to-implementation mapping.
   - Variant, state, and responsive coverage matrix.
   - Figma structure summary.
   - Project convention scan result.
   - Components to reuse.
   - Components to create.
   - Token mapping strategy.
   - Layout strategy.
   - Fixed-size versus adaptive-size strategy.
   - Asset handling strategy.
   - Responsive strategy.
   - Accessibility strategy.
   - Visual verification targets and comparison conditions.
   - Open questions.
6. Ask the user before coding when the target node, layer data, or a key UI,
   interaction, responsive, sizing, asset, or business requirement is unclear.

During implementation:

1. Prefer project tokens and component APIs over hardcoded values.
2. Use a flex-first layout strategy.
3. Use grid only for true two-dimensional layouts.
4. Use absolute positioning only for overlays, badges, layered elements, decoration, or unavoidable overlap.
5. Componentize by meaningful UI structure; do not build the full screen as one large component.
6. Do not blindly copy all Figma widths and heights. Keep core visual elements fixed when appropriate and business-content containers adaptive by default.
7. Handle real content states such as long text, empty data, loading, errors, missing images, and overflow.
8. Follow the project's existing tech stack, code style, naming, and directory structure.
9. Implement every mapped visible or interactive layer and every in-scope
   coverage entry, and record the reason for each deliberate omission.
10. Preserve semantic HTML, keyboard operation, logical focus behavior,
    accessible names, and the project's accessibility conventions.

After implementation:

1. Summarize the target node, layer coverage, unresolved references,
   coverage matrix, deliberate omissions, changed files, reused components,
   created components, token usage, raw Figma values, accessibility decisions,
   fixed-size decisions, and adaptive-size decisions.
2. Call out known differences from Figma.
3. Run available checks such as lint, typecheck, build, tests, Storybook,
   Playwright, accessibility checks, and the visual verification loop.
4. Explain how to run and verify the result.

## Default Rules

- Project design system first, Figma raw values second.
- Existing components first, new components second.
- Read the target layer tree before designing the implementation when structured
  Figma data is available.
- Treat layers as evidence for component design, not as a one-layer-per-component
  mandate.
- Flex first, grid when necessary, absolute only for overlays, overlap, and decoration.
- Fixed core visual elements, adaptive business-content containers.
- Native semantics and accessible interaction are implementation requirements,
  even when Figma does not express them.
- Ask before guessing critical UI or product behavior.
- Do not introduce new UI libraries, modify unrelated global styles, restructure unrelated code, or refactor unrelated business logic unless explicitly requested.
