# Changelog

All notable changes to this skills library are tracked here.

This repository uses Git tags or commit SHAs for source versioning and install
pinning. Do not add hand-maintained version fields to source `SKILL.md`
frontmatter.

## Unreleased

### Added

- Added initial changelog entries for the existing `figma-ui`, `resume`, and
  `workflow-insights` skills.
- Added `AGENTS.md` repository instructions for AI agents.
- Added CLI-first quick installation documentation.
- Added an infrastructure design covering repository boundaries,
  releases, dependencies, security, and future evolution.

### Changed

- Expanded `figma-ui` with structured Figma link target resolution, complete
  relevant layer traversal, semantic layer-to-implementation mapping,
  variant/state/responsive coverage, accessibility guardrails, and repeatable
  visual verification.
- Documented `agents/` as an optional skill subdirectory for agent-specific
  metadata.
- Expanded `AGENTS.md` into the repository-wide working agreement for agent
  workflow, change scope, Git policy, and verification.
- Made `workflow-insights` session inventory output deterministic by sorting
  session files before processing.

### Fixed

- Kept resume rewrites evidence-backed and prevented placeholder-bearing drafts
  from being labeled final or export-ready.
- Hardened skill installation examples, documented pinned update behavior, and
  aligned GitHub Copilot project paths with `.agents/skills`.
- Skipped current Codex wrapper messages in workflow session inventories.

### Removed

- Removed the protected-`main` ruleset, GitHub Actions validation, repository
  lint and commit-message enforcement, and the versioned `pre-commit`,
  `commit-msg`, and `pre-push` hooks for a direct-to-`main` solo workflow.
