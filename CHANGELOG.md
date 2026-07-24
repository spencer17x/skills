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
- Added an infrastructure design covering repository boundaries, validation,
  releases, dependencies, security, and future evolution.
- Added Conventional Commit documentation, a dependency-free validator,
  regression tests, an optional local `commit-msg` hook, and CI enforcement.
- Added an idempotent contributor bootstrap command with prerequisite checks,
  safe Git hook configuration, custom-hook protection, and regression coverage.
- Added pre-push validation that rejects invalid outgoing commit messages before
  Git transfers commit objects, with bootstrap, CI, and regression coverage.
- Added staged-snapshot `pre-commit` validation, committed-tip `pre-push`
  validation, and a shared `scripts/check` entrypoint for local and CI checks.
- Allowed valid temporary autosquash commits locally while keeping hook-enabled
  pushes and final merge validation strict.
- Added an active no-bypass `main` ruleset requiring pull requests and the
  up-to-date GitHub Actions `validate` check while blocking deletion and force
  pushes.
- Documented the server-side ruleset and `pre-receive` boundaries, including the
  current GitHub limitation and unreachable-object behavior.

### Changed

- Aligned validation with Codex App Git workflows by enforcing Conventional
  Commit formatting on pull request titles and final `main` commits, keeping
  topic-branch messages provisional, and using squash-only merges.
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
- Hardened GitHub Actions with read-only permissions, concurrency cancellation,
  pull-request title edit events, event-range whitespace checks, and a timeout.

### Fixed

- Kept resume rewrites evidence-backed and prevented placeholder-bearing drafts
  from being labeled final or export-ready.
- Hardened skill installation examples, documented pinned update behavior, and
  aligned GitHub Copilot project paths with `.agents/skills`.
- Rejected non-string skill frontmatter values and added a validator regression
  test.
- Skipped current Codex wrapper messages in workflow session inventories.
- Checked committed whitespace ranges in CI instead of the clean checkout.
