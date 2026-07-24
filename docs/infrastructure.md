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
  -> squash merge to main
  -> changelog and optional Git tag
  -> install or update by tag/SHA
```

Source files remain the system of record. Installed copies and any provenance
metadata added by an installer are derived state and must not flow back into the
source tree by default.

## Validation Contract

The current local prerequisites are Git, Ruby, Bash, `jq`, `sort`, and `tar`.
The checks use no project-specific package installation or lockfile. The local
validation surface is intentionally small:

```bash
scripts/check
git diff --check
```

`scripts/check` runs the repository validator and every maintenance regression
test. `scripts/validate-skills` checks skill shape and frontmatter, agent and
workflow YAML, local Markdown links, maintenance-script syntax and
executability, and small deterministic helper fixtures.

GitHub Actions is the remote enforcement layer. Pull requests and pushes to
`main` run the same repository validation, validator tests, whitespace checks,
and relevant commit-message checks. Pull requests validate the title that will
become the squash commit title without rejecting provisional topic-branch
commit messages. Pushes to `main` validate the resulting commit range. The
workflow uses read-only permissions, cancels superseded runs, reruns when a pull
request title is edited, and has a bounded timeout.

The active `Protect main with required CI` repository ruleset has no bypass
actors. It blocks deletion and force pushes, requires all `main` changes to use a
pull request, requires review threads to be resolved, and requires the
GitHub Actions `validate` check to pass against an up-to-date branch. The
required check is pinned to the GitHub Actions App rather than accepting an
arbitrary status with the same name. This makes CI authoritative for reachable
`main` history while leaving topic branches available for normal collaboration.
Repository merge settings allow squash merges only and use the validated pull
request title as the final commit title.

Validation should fail fast with actionable output. A new invariant belongs in
the local validator first, with a regression fixture when practical, and only
then in CI. CI-specific shell should remain orchestration rather than a second
implementation of repository policy.

## Commit Enforcement

[`docs/commit-conventions.md`](commit-conventions.md) defines the policy.
`scripts/validate-commit-message` is its executable implementation.

Contributors should initialize a fresh checkout with:

```bash
scripts/bootstrap
```

The command checks local prerequisites, validates the hook entrypoints, and
writes checkout-local Git configuration when no hooks path is already active.
It is idempotent and refuses to override a custom local or global hooks path. In
that case, integrate `.githooks/pre-commit`, `.githooks/commit-msg`, and
`.githooks/pre-push` with the existing hook setup manually. The first validates
the exact index snapshot, the second validates the message, and the third checks
all outgoing commits plus each unique committed tip snapshot. These hooks are
optional early feedback and may be bypassed by Codex App's built-in Git
controls. Remote enforcement relies on the validated pull request title,
required CI, protected `main`, and squash-only merges. Existing history is not
rewritten to satisfy newly introduced rules.

GitHub Actions runs after refs are updated. A host-controlled `pre-receive` hook
would still be required for a client-independent before-transfer guarantee; this
repository instead guarantees the validated history reachable from `main`.

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
