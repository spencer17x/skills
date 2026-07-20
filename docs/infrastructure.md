# Infrastructure Design

## Goals

The repository infrastructure should make every skill easy to inspect, install,
validate, and pin without turning this library into an application platform.

The design optimizes for:

- portable, self-contained skill directories;
- text-first review and small diffs;
- deterministic local checks that match CI;
- minimal dependencies and no required long-running services;
- traceable releases through changelog entries and immutable Git references.

It intentionally does not host standalone MCP servers, credentialed runtime
integrations, registries, build products, or dependency-heavy applications.

## System Boundaries

| Layer | Location | Responsibility |
| --- | --- | --- |
| Product source | `skills/<skill-name>/` | Portable skill instructions, references, assets, helpers, and optional agent adapters |
| Governance | `AGENTS.md`, `docs/` | Agent behavior, authoring rules, installation guidance, architecture, and contribution policy |
| Local tooling | `scripts/`, `.githooks/` | Deterministic validation and optional pre-commit-time policy enforcement |
| CI | `.github/workflows/` | Re-run local policy checks on pull requests and pushes to `main` |
| Release record | `CHANGELOG.md`, Git tags and SHAs | Human-readable changes and immutable install pins |

Dependencies, credentials, persistent processes, or APIs that have an
independent lifecycle cross the repository boundary and should be maintained in
a separate tool or MCP server repository. A small deterministic helper may stay
inside one skill when it exists only to support that skill.

## Repository Topology

```text
.
├── AGENTS.md
├── CHANGELOG.md
├── README.md
├── .github/workflows/
├── .githooks/
├── docs/
├── scripts/
└── skills/
    └── <skill-name>/
        ├── SKILL.md
        ├── agents/       # optional
        ├── assets/       # optional
        ├── references/   # optional
        └── scripts/      # optional
```

The flat `skills/` namespace is a deliberate distribution contract. A skill can
be copied or installed by selecting exactly one directory. Navigation should be
improved with metadata or indexes before nested category directories are
considered.

## Change Flow

```text
author change
  -> local validation
  -> pull request and CI
  -> merge to main
  -> changelog and optional Git tag
  -> install or update by tag/SHA
```

Source files remain the system of record. Installed copies and any provenance
metadata added by an installer are derived state and must not flow back into the
source tree by default.

## Validation Contract

The current local prerequisites are Git, Ruby, Bash, and `jq`. The checks use no
project-specific package installation or lockfile. The local validation surface
is intentionally small:

```bash
scripts/validate-skills
scripts/test-validate-skills
scripts/test-validate-commit-message
git diff --check
```

`scripts/validate-skills` checks skill shape and frontmatter, agent and workflow
YAML, local Markdown links, maintenance-script syntax and executability, and
small deterministic helper fixtures. The two test scripts protect validator
behavior against regression.

GitHub Actions is the remote enforcement layer. Pull requests and pushes to
`main` run the same repository validation, validator tests, whitespace checks,
and commit-message checks. Pull request titles are checked because they may
become squash-merge messages; each new non-merge commit in the event range is
checked as well.

Validation should fail fast with actionable output. A new invariant belongs in
the local validator first, with a regression fixture when practical, and only
then in CI. CI-specific shell should remain orchestration rather than a second
implementation of repository policy.

## Commit Enforcement

[`docs/commit-conventions.md`](commit-conventions.md) defines the policy.
`scripts/validate-commit-message` is its executable implementation.

Developers may enable the repository-provided local hook with:

```bash
git config core.hooksPath .githooks
```

This writes checkout-local Git configuration. If the checkout already uses a
custom hooks path, integrate the validator there instead of replacing it. The
hook is optional developer ergonomics; CI remains authoritative. Existing
history is not rewritten to satisfy newly introduced rules.

## Release and Distribution

1. Record notable changes under `Unreleased` in `CHANGELOG.md`.
2. Merge validated changes to `main`.
3. Create a Git tag when an immutable named release is useful.
4. Install from a tag or commit SHA when reproducibility matters; use `main`
   only when intentionally tracking the latest source state.

There are no hand-maintained versions in source `SKILL.md` frontmatter. Git tags
and SHAs are the version boundary for the whole source repository. If the
library later needs independent per-skill releases, that is an architectural
change requiring an explicit migration design rather than ad hoc version fields.

## Dependency and Security Policy

- Prefer operating-system tools and language standard libraries for repository
  maintenance.
- Pin third-party CI actions to a reviewed major version at minimum; use an
  immutable commit when the threat model requires it.
- Never require credentials for local validation.
- Never store secrets, private session data, generated caches, or installed
  skill copies in source control.
- Validation commands must not fetch mutable remote data. CI may install
  declared prerequisites before running checks.

## Evolution Rules

Change this design when the repository's actual constraints change, not in
anticipation of hypothetical scale. In particular:

- add metadata or an index before changing the flat skill layout;
- add a dependency only when a standard-library solution is materially worse
  and the operational cost is documented;
- split out a service when it gains credentials, persistent state, its own
  release cadence, or substantial dependencies;
- add a new CI job only when it enforces a distinct failure domain or materially
  improves feedback time;
- document breaking infrastructure decisions in `CHANGELOG.md` and update
  `AGENTS.md`, `README.md`, and this document together when their contracts move.
