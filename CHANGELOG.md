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
- Added repository validation script for skills, links, metadata, and shell
  helpers.
- Added GitHub Actions validation for pull requests and pushes to `main`.

### Changed

- Documented `agents/` as an optional skill subdirectory for agent-specific
  metadata.
- Made `workflow-insights` session inventory output deterministic by sorting
  session files before processing.

### Fixed

- Kept resume rewrites evidence-backed and prevented placeholder-bearing drafts
  from being labeled final or export-ready.
- Hardened skill installation examples, documented pinned update behavior, and
  aligned GitHub Copilot project paths with `.agents/skills`.
- Rejected non-string skill frontmatter values and added a validator regression
  test.
- Skipped current Codex wrapper messages in workflow session inventories.
- Checked committed whitespace ranges in CI instead of the clean checkout.
