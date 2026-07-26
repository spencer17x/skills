# Infrastructure Design

## Goals

This repository is a lightweight personal library of portable Agent Skills. It
optimizes for:

- self-contained skill directories;
- text-first review and small diffs;
- simple direct-to-`main` maintenance;
- immutable version references through Git tags and commit SHAs.

It intentionally does not host standalone MCP servers, credentialed runtime
integrations, registries, build products, or dependency-heavy applications.

## System Boundaries

| Layer | Location | Responsibility |
| --- | --- | --- |
| Product source | `skills/<skill-name>/` | Portable skill instructions, references, assets, helpers, and optional agent adapters |
| Governance | `AGENTS.md`, `docs/` | Agent behavior, authoring rules, installation guidance, architecture, and maintenance policy |
| Release record | `CHANGELOG.md`, Git tags and SHAs | Human-readable changes and immutable install pins |

Dependencies, credentials, persistent processes, or APIs that have an
independent lifecycle belong in a separate tool or MCP server repository. A
small deterministic helper may stay inside one skill when it exists only to
support that skill.

## Repository Topology

```text
.
├── AGENTS.md
├── CHANGELOG.md
├── README.md
├── docs/
└── skills/
    └── <skill-name>/
        ├── SKILL.md
        ├── agents/       # optional
        ├── assets/       # optional
        ├── references/   # optional
        └── scripts/      # optional
```

The flat `skills/` namespace is a distribution contract. A skill can be copied
or installed by selecting exactly one directory. Add metadata or an index
before considering nested category directories.

## Change Flow

```text
author change
  -> review the local diff
  -> run checks supplied by the changed skill, when present
  -> commit and push directly to main
  -> update the changelog or create a Git tag when useful
```

Source files remain the system of record. Installed copies and provenance
metadata added by an installer are derived state and should not flow back into
the source tree by default.

## Repository Policy

This personal repository has no protected-branch ruleset, required status
check, repository-level GitHub Actions workflow, repository-managed Git hooks,
or commit-message linter. Direct pushes to `main` are allowed.

Changes should still remain narrow and reviewable. Inspect the final diff and
working-tree status before pushing. When a skill contains its own deterministic
helper or test, run the checks that are relevant to that skill.

## Release and Distribution

1. Record notable changes under `Unreleased` in `CHANGELOG.md`.
2. Commit and push the reviewed change to `main`.
3. Create a Git tag when an immutable named release is useful.
4. Install from a tag or commit SHA when reproducibility matters; use `main`
   only when intentionally tracking the latest source state.

There are no hand-maintained versions in source `SKILL.md` frontmatter. Git tags
and SHAs are the version boundary for the whole repository.

## Dependency and Security Policy

- Keep skills text-first and dependency-light.
- Never store secrets, private session data, generated caches, or installed
  skill copies in source control.
- Keep standalone services and credentialed integrations outside this
  repository.
- Prefer operating-system tools or language standard libraries for
  skill-specific deterministic helpers.

## Evolution Rules

Change this design when the repository's actual constraints change, not in
anticipation of hypothetical scale. In particular:

- add metadata or an index before changing the flat skill layout;
- add a dependency only when its value outweighs its maintenance cost;
- split out a service when it gains credentials, persistent state, its own
  release cadence, or substantial dependencies;
- document infrastructure decisions in `CHANGELOG.md` and update `AGENTS.md`,
  `README.md`, and this document together when their contracts move.
