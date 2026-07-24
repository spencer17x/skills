# Agent Instructions

## Purpose

This repository is a personal Agent Skills library. Keep changes narrow,
text-first, deterministic, and easy to install across compatible coding agents.

The root `AGENTS.md` applies to the whole repository. If a nested `AGENTS.md` is
ever added, follow the nearest file for that subtree without weakening these
repository-wide safety and validation rules.

## Start Here

Before editing:

1. Read the user request and the relevant skill, reference, or maintenance
   script in full.
2. Inspect `git status --short` and preserve unrelated or user-authored changes.
3. Check nearby files and existing conventions before introducing a new pattern.
4. Choose the smallest change that fully solves the request.

Do not commit, push, publish, tag, or rewrite history unless the user explicitly
asks for that action.

## Repository Map

```text
skills/<skill-name>/       installable, self-contained skills
docs/                      repository conventions and operator documentation
scripts/                   deterministic repository maintenance commands
.githooks/                 optional local Git policy enforcement
.github/workflows/         CI policy enforcement
AGENTS.md                   agent working agreement
CHANGELOG.md                human-readable source changes
```

Installable skills live directly under `skills/<skill-name>/`. Do not add
category directories under `skills/` unless the repository conventions are
updated first.

Each skill may contain only what it needs:

```text
skills/<skill-name>/
  SKILL.md
  references/  # optional detailed material
  scripts/     # optional deterministic helpers for that skill
  assets/      # optional templates or reusable files
  agents/      # optional agent-specific metadata or prompts
```

Root `scripts/` is for repository maintenance only. Standalone MCP servers,
runtime services, credentials, or dependency-heavy tools belong in a separate
repository. See [`docs/infrastructure.md`](docs/infrastructure.md) for the full
boundary and lifecycle design.

## Skill Contract

- Keep skill folder names lowercase kebab-case.
- Keep the folder name and `SKILL.md` frontmatter `name` aligned.
- Keep source `SKILL.md` frontmatter to `name` and `description`.
- Put trigger conditions in `description`; keep the body concise and procedural.
- Use one primary language per skill. Keep frontmatter, body, references, script
  help text, and `agents/` metadata in that language unless the skill is
  explicitly bilingual or multilingual.
- Move large examples, schemas, policies, or style guides into `references/`.
- Put deterministic reusable helpers in the skill's `scripts/` directory.
- Do not add hand-maintained per-skill versions. Use Git tags or commit SHAs and
  `CHANGELOG.md` for source versioning.
- Never copy installer-generated provenance metadata back into source
  `SKILL.md` files unless the repository convention is intentionally changed.

Detailed authoring rules live in
[`docs/skill-conventions.md`](docs/skill-conventions.md).

## Change Contract

- Preserve backward compatibility unless the request explicitly requires a
  breaking change; document intentional breaks prominently.
- Prefer standard-library, dependency-free maintenance tooling. New runtime or
  network dependencies need a clear repository-level justification.
- Keep scripts deterministic, non-interactive by default, and explicit about
  failures through actionable stderr output and a non-zero exit status.
- Update `README.md` when discoverability, installation, or the public project
  shape changes.
- Update `CHANGELOG.md` for user-visible skill, documentation, tooling, CI, or
  installation changes.
- Do not commit credentials, tokens, private data, local machine paths, caches,
  build artifacts, or generated installer metadata.

## Installation Documentation

- Prefer CLI-first install instructions.
- Keep manual copy or symlink instructions as fallback, debugging, or local
  development paths.
- Do not invent agent commands. If an agent has no confirmed install command,
  say so and provide the supported filesystem path.
- Include verification, update, uninstall, and version-pinning notes whenever
  installation behavior changes.

## Git and Commit Messages

- Follow [`docs/commit-conventions.md`](docs/commit-conventions.md).
- Use Conventional Commit headers for agent-authored commits and pull request
  titles: `type(scope): summary`; scope is optional.
- Keep commits atomic and exclude unrelated formatting or cleanup.
- Use the skill name as scope for skill-specific changes and an infrastructure
  area such as `infra`, `validation`, or `release` for repository-wide changes.
- Do not push directly to `main`. The active remote ruleset requires a pull
  request, a successful up-to-date `validate` check, and a squash merge whose
  final title comes from the validated pull request title.
- In a fresh contributor checkout, run `scripts/bootstrap` once before the first
  commit. It checks prerequisites and enables the versioned Git hooks without
  replacing an existing custom hooks path.
- Before handing off any tracked-file change, run the complete `scripts/check`
  suite.
- Before handing off a requested commit, validate its message with
  `scripts/validate-commit-message`.

## Verification

Run the checks that match the files changed:

| Change | Required checks |
| --- | --- |
| Skill, docs, metadata, or repository policy | `scripts/validate-skills` |
| Contributor bootstrap | `scripts/test-bootstrap` |
| Skill validator | `scripts/test-validate-skills` |
| Staged-content validator or `pre-commit` hook | `scripts/test-validate-staged` |
| Commit-message validator or `commit-msg` hook | `scripts/test-validate-commit-message` |
| Outgoing-commit validator or `pre-push` hook | `scripts/test-validate-pushed-commits` |
| Validation orchestration or CI workflow | `scripts/check` |
| Shell helper | `bash -n <script>` and a small happy-path fixture when practical |
| Any tracked-file change | `git diff --check` |

Before handoff, inspect `git status --short` and the final diff. Report what was
changed, what was verified, and any check that could not be run.
