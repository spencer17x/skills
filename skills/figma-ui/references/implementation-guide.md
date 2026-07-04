# Figma UI Implementation Guide

This guide expands the `figma-ui` skill with detailed implementation rules for pixel-faithful UI work.

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

## Responsive Behavior

If Figma provides multiple breakpoints, implement each relevant breakpoint.

If Figma only provides desktop design, ask whether mobile or tablet adaptation is required. If the user asks to proceed without clarification, preserve desktop fidelity and add basic adaptive safeguards to prevent obvious overflow or broken layouts.

Use the project's existing breakpoints and responsive patterns.

## Interaction States

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

In the final summary, include:

1. Files changed.
2. Components reused.
3. Components created.
4. Styles sourced from project tokens.
5. Styles sourced from Figma raw values.
6. Fixed-size decisions.
7. Adaptive-size decisions.
8. Known differences from Figma.
9. How to run and verify.
10. Checks that passed or could not be run.

## Do Not

Do not:

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
