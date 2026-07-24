# Figma UI Implementation Guide

This guide expands the `figma-ui` skill with detailed implementation rules for pixel-faithful UI work.

## Contents

- [Figma Link and Layer Intake](#figma-link-and-layer-intake)
- [Layer-to-Implementation Mapping](#layer-to-implementation-mapping)
- [Figma Analysis Checklist](#figma-analysis-checklist)
- [Project Scan Checklist](#project-scan-checklist)
- [Layout Rules](#layout-rules)
- [Sizing Rules](#sizing-rules)
- [Componentization Rules](#componentization-rules)
- [Token Mapping](#token-mapping)
- [Text and Overflow](#text-and-overflow)
- [Assets and Media](#assets-and-media)
- [Variant, State, and Responsive Coverage](#variant-state-and-responsive-coverage)
- [Accessibility](#accessibility)
- [Implementation Constraints](#implementation-constraints)
- [Verification](#verification)
- [Do Not](#do-not)

## Figma Link and Layer Intake

First determine the available input mode:

1. **Structured mode:** A Figma integration, API, or supplied document export
   exposes node IDs, types, properties, and parent-child relationships.
2. **Visual-only mode:** Only a screenshot, rendered preview, or other pixel
   reference is available.

In visual-only mode, state that component hierarchy and constraints are inferred.
Do not claim to have inspected Figma layers, variants, variables, or hidden
content. If the user specifically requires layer-aware implementation, request
structured access or a structured export before coding.

In structured mode:

1. Parse the link and resolve its file and target `node-id` when present.
2. If the link targets a file or page rather than a specific frame, enumerate
   candidate frames and confirm the implementation target when it is ambiguous.
3. Recursively traverse the target node's complete descendant subtree. Preserve
   node ID, name, type, parent-child order, visibility, and relevant layout,
   style, content, interaction, and asset properties.
4. Inspect the ancestor path through its containing Frame, Section, and Page
   when those nodes provide layout, variant, or responsive context.
5. Resolve referenced Component, Component Set, Instance, Variant, Variable,
   Style, image, vector, and other asset definitions needed to understand or
   implement the target.
6. Follow tool pagination, depth, or response-size continuations until the
   target subtree is complete. Do not treat a truncated response as full
   coverage.
7. Inventory hidden, unavailable, unresolved, or intentionally excluded nodes
   with a reason instead of silently dropping them.

The complete relevant hierarchy means the full target subtree, necessary
ancestors, and referenced definitions. It does not require scanning unrelated
pages or frames in the same file.

Before planning, report:

- Target file, page, and root node name, type, and ID when available.
- Number and types of nodes inspected when the tool exposes this information.
- Component instances, variants, styles, variables, and assets referenced.
- Hidden or deliberately excluded nodes.
- Truncated, inaccessible, unresolved, or ambiguous data.

## Layer-to-Implementation Mapping

Use the inspected hierarchy to produce a concise mapping before coding. For each
meaningful branch or repeated pattern, record:

| Figma source | Design role | Implementation | Layout and sizing | Style source | Status |
| --- | --- | --- | --- | --- | --- |
| Node path or ID | Section, control, content, decoration, or state | Existing component, new component, DOM/CSS, asset, or deliberate omission | Flex, grid, overlay, fixed, or adaptive | Project token, component default, Figma value, or asset | Ready, unresolved, or omitted with reason |

Derive implementation structure semantically:

- Map existing Figma components and instances to existing project components
  first.
- Consider repeated structures, independent interactions, business regions,
  and meaningful reusable units as component candidates.
- Treat Groups, Frames, and Auto Layout wrappers as layout evidence; keep them
  as ordinary DOM or CSS unless they have independent meaning or reuse.
- Treat vectors, masks, fills, and purely decorative layers as assets, CSS, or
  pseudo-elements when appropriate.
- Use layer names as hints, not proof of component boundaries.
- Do not create one front-end component for every Figma layer.

Do not start implementation until the target root is known, traversal is
complete or its limitations are disclosed, meaningful layers are mapped, and
blocking references or product questions are resolved.

## Figma Analysis Checklist

Before coding, inspect:

- Page structure and frame variants.
- Component hierarchy and reusable regions.
- Layout model and alignment.
- Colors, gradients, opacity, borders, radii, and shadows.
- Font family, font size, weight, line height, and letter spacing.
- Padding, margin, gap, width, height, and min/max constraints.
- Icons, images, SVGs, videos, charts, and other media.
- Hover, active, focus, disabled, selected, loading, empty, expanded, and collapsed states.
- Responsive variants and breakpoints.
- Dynamic data states such as long text, empty content, missing images, loading, and errors.

If there are multiple frames, versions, or states and the target is unclear, ask the user which one to implement.

## Project Scan Checklist

Search for project conventions and reusable parts, including:

- `theme`, `tokens`, `design-system`, `components`, `ui`, `shared`, `common`, `styles`, `assets`, and `icons`.
- `tailwind.config.*`, `variables.css`, `global.css`, `tokens.*`, `theme.*`, `components/ui`, `src/components`, and `src/shared/components`.
- Existing layout, form, button, input, modal, drawer, tabs, table, card, list, icon, and typography components.
- Existing lint, typecheck, build, test, Storybook, Playwright, or screenshot workflows.

## Layout Rules

Use a flex-first layout strategy:

1. Prefer `flex` for one-dimensional layouts.
2. Use `grid` only for true two-dimensional layouts or complex row/column composition.
3. Use normal block or inline layout when it is simpler and more semantic.
4. Use `position: relative` or `absolute` only for overlays, badges, layered elements, decorative effects, or unavoidable visual overlap.
5. Avoid fixed `top`, `left`, and transform magic numbers for normal document-flow layout.

Default rule:

**Flex first, grid when necessary, absolute only for overlays, overlap, and decoration.**

If a Figma layout appears to use absolute positioning but can be implemented more maintainably with flex or grid, use the maintainable layout while preserving the visual result.

## Sizing Rules

Do not blindly copy every Figma `width` and `height` into code.

Figma dimensions are visual references, not always fixed code constraints. Decide sizing based on visual fidelity, responsiveness, content growth, maintainability, and project conventions.

Use sizing strategies in this order:

1. Content-driven size.
2. Container constraints.
3. `min-width` / `max-width`.
4. `min-height` / `max-height`.
5. Percentage width or `flex: 1`.
6. Fixed width or height.
7. Absolute-positioned dimensions.

### Usually adaptive

Prefer adaptive sizing for:

- Page containers.
- Main content regions.
- Lists and list containers.
- Table containers.
- Card groups.
- Text containers.
- Forms and form regions.
- Toolbar internals.
- Header and footer internals.
- Modal content regions.
- Dynamic content cards.
- Responsive split panels.

Use tools such as `width: 100%`, `max-width`, `min-width`, `height: auto`, `min-height`, `flex: 1`, `flex-shrink`, `flex-grow`, `overflow`, and project breakpoints.

### Usually fixed

Fixed sizes are acceptable for:

- Icons.
- Avatars.
- Logos.
- Button height.
- Input height.
- Checkbox, radio, switch, tag, badge, and tooltip arrow sizes.
- Skeleton placeholders.
- Table row height.
- Tab and menu item height.
- Fixed sidebars.
- Fixed top navigation.
- Fixed bottom action bars.
- Images or covers with a clearly fixed ratio.

Use project component specs and tokens before Figma raw values.

### Require options for gray areas

For ambiguous elements, present two or three options and let the user choose before implementing. Examples include:

- Card width.
- Modal width.
- Drawer width.
- Table column width.
- Image display regions.
- Banner height.
- Chart regions.
- Multi-column layout widths.
- Button width.
- Search input width.
- Empty-state illustration size.
- Detail-page side panel ratio.
- Marketing hero height.

Use this option format:

- Option A: strict fixed Figma dimensions. Highest visual fidelity, weaker responsiveness.
- Option B: adaptive width and content-driven height. Better for real data, may differ slightly from the static design.
- Option C: fixed core visual elements with adaptive outer containers. Balanced fidelity and maintainability.

If the user does not specify, default to:

**Fixed core visual elements, adaptive business-content containers.**

## Componentization Rules

Do not implement the whole screen as one large component.

Split by design structure and project conventions. Common examples:

- Page.
- Section.
- Header.
- Toolbar.
- Sidebar.
- Card.
- List and list item.
- Form and field.
- Button group.
- Empty state.
- Modal or drawer.
- Tabs.
- Table.
- Footer.

Components should be semantic, maintainable, reusable when useful, and not over-abstracted. Avoid meaningless wrappers and do not split components only for the sake of splitting.

## Token Mapping

When possible, map Figma values to project tokens and mention the mapping in the plan or summary.

Example:

```text
Figma color #1677ff -> var(--color-primary)
Figma spacing 24px -> spacing-6
Figma radius 8px -> radius-md
Figma font 14px -> text-sm
```

If no token exists, state that the raw value is temporary or local:

```text
Figma color #F5F7FA -> no matching project token; use a local value for this component only
```

Do not claim to use project conventions while hardcoding most visual values.

## Text and Overflow

Do not size text containers only for the sample text shown in Figma.

Handle or ask about:

- Single-line ellipsis.
- Multi-line clamping.
- Long English words, numbers, addresses, hashes, and order IDs.
- Tooltips for truncated table cells.
- Whether card titles can wrap.
- Whether long button labels can grow the button.
- Mixed Chinese and English text.
- Whether numeric values need tabular or monospace digits.

## Assets and Media

For images, icons, SVGs, video, illustrations, and charts:

1. Check whether the project already has the same or similar asset.
2. Reuse project assets when available.
3. Export or add Figma assets only when needed.
4. Convert SVG icons into components when that matches project style.
5. Put assets in the project's existing asset directory.
6. Use semantic asset names.

Clarify or decide according to project conventions:

- Fixed size versus aspect ratio.
- `object-fit: cover` versus `contain`.
- Cropping versus full display.
- Lazy loading.
- Placeholder or fallback state.
- Responsive image sizes.

Do not use random external image URLs.

## Variant, State, and Responsive Coverage

Before coding, create a coverage matrix for every explicitly designed or
product-required variant, state, and responsive frame:

| Figma source | Coverage axis | Values or target frames | Implementation | Status |
| --- | --- | --- | --- | --- |
| Component Set, interaction, or frame IDs | Variant property, state, or viewport | Relevant values, states, or dimensions | Project component behavior, new implementation, or test target | Ready, inherited, out of scope with reason, or unresolved |

Include relevant:

- Component Set properties and Variant values.
- Instance properties that alter visible content or behavior.
- Hover, active, focus, disabled, selected, loading, error, empty, expanded,
  and collapsed states.
- Prototype destinations, overlays, and transitions that define required
  product behavior.
- Desktop, tablet, mobile, and other explicitly supplied responsive frames.

Cover the combinations shown in Figma or required by the product. Do not
generate the full Cartesian product of every property unless those combinations
are meaningful. Use the matrix to choose implementation, test, and screenshot
targets, and disclose every inherited, unresolved, or out-of-scope entry.

### Responsive Behavior

If Figma provides multiple breakpoints, implement each relevant breakpoint.

If Figma only provides desktop design, ask whether mobile or tablet adaptation is required. If the user asks to proceed without clarification, preserve desktop fidelity and add basic adaptive safeguards to prevent obvious overflow or broken layouts.

Use the project's existing breakpoints and responsive patterns.

### Interaction States

Implement Figma-provided states when available:

- Hover.
- Active.
- Focus.
- Disabled.
- Loading.
- Selected.
- Error.
- Empty.
- Expanded.
- Collapsed.

If Figma omits states but project components already support them, inherit the project component behavior. If a missing state affects product behavior, ask the user.

## Accessibility

Treat accessibility as an implementation requirement even when Figma does not
encode it:

- Prefer native semantic elements and controls. Use ARIA only when native
  semantics are insufficient.
- Preserve meaningful heading order, landmarks, reading order, and accessible
  names and descriptions.
- Make every interaction keyboard operable with a logical focus order and a
  visible focus indicator.
- Manage focus correctly for modals, drawers, menus, popovers, and other
  layered interactions.
- Do not communicate meaning or state through color alone. Follow the project's
  contrast requirements.
- Provide text alternatives for informative images and icons, and hide purely
  decorative assets from assistive technology.
- Honor the project's reduced-motion behavior for non-essential animation.
- Reuse existing component accessibility behavior and do not regress it while
  matching the Figma appearance.

If visual fidelity conflicts with semantic or accessible behavior, preserve
accessibility and disclose the visual difference.

## Implementation Constraints

Follow the existing tech stack and code style.

- React: follow existing React patterns.
- Next.js: follow the existing app router or pages router structure.
- Vue: follow existing Vue conventions.
- TypeScript: provide reasonable types.
- Tailwind: prefer existing Tailwind tokens and config.
- CSS Modules: follow existing naming style.
- styled-components: follow existing style organization.
- shadcn/ui, Ant Design, MUI, or similar: reuse existing project wrappers first.

Do not introduce a new UI library, change global styles, restructure unrelated code, or refactor unrelated business logic unless the user explicitly asks.

## Verification

After implementation, run the relevant available checks when possible:

- Lint.
- Typecheck.
- Build.
- Unit or component tests.
- Storybook.
- Playwright or browser screenshot.
- Visual diff against a Figma export or reference screenshot when available.
- Available accessibility automation plus a keyboard and focus smoke test.

### Visual Verification Loop

When a rendered reference is available:

1. Define comparison targets from the coverage matrix.
2. Match each target's viewport or frame dimensions, browser zoom, theme,
   content, state, and loaded fonts and assets. Record any comparison condition
   that cannot be matched.
3. Stabilize dynamic data and motion when the project supports doing so, then
   capture the implementation screenshot.
4. Compare it with the Figma render using an overlay, visual diff, or careful
   side-by-side inspection.
5. Fix differences in this order: structure and geometry, typography, color and
   effects, assets, then micro-spacing.
6. Repeat capture and comparison until the result meets the user or project's
   acceptance criteria. Document remaining differences rather than claiming
   pixel fidelity without evidence.

If screenshot tooling is unavailable, perform the strongest available manual
comparison and state the limitation.

In the final summary, include:

1. Target Figma root and layer coverage.
2. Unresolved references and deliberate layer omissions.
3. Variant, state, and responsive coverage status.
4. Files changed.
5. Components reused.
6. Components created.
7. Styles sourced from project tokens.
8. Styles sourced from Figma raw values.
9. Accessibility decisions and checks.
10. Fixed-size decisions.
11. Adaptive-size decisions.
12. Visual comparison conditions and results.
13. Known differences from Figma.
14. How to run and verify.
15. Checks that passed or could not be run.

## Do Not

Do not:

- Claim complete Figma layer inspection from pixels alone.
- Stop at the first partial or truncated structured-node response.
- Scan unrelated Figma pages when the linked target and its dependencies are
  already clear.
- Map every Figma layer to a separate front-end component.
- Validate only the default state or a single viewport when more targets are in
  scope.
- Sacrifice semantics, keyboard operation, or focus behavior for visual fidelity.
- Claim pixel fidelity without a matched, repeatable visual comparison.
- Code before scanning project conventions.
- Create new components before checking existing ones.
- Hardcode large amounts of color, spacing, typography, or layout values.
- Blindly copy all Figma widths and heights.
- Use fixed container heights that break dynamic content.
- Cause small-screen overflow with fixed widths.
- Use approximate styles when exact values or tokens are available.
- Abuse `position: absolute` for normal layout.
- Use magic `top`, `left`, or `transform` values for ordinary alignment.
- Ignore hover, active, focus, disabled, loading, or empty states.
- Ignore text overflow and long real-world content.
- Ignore project code style.
- Guess critical UI or product requirements.
- Add unrelated dependencies.
- Modify unrelated global styles or business logic.
