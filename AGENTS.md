# Agent Instructions

## Purpose

This repository is a personal Agent Skills library. Keep changes narrow,
text-first, deterministic, and easy to install across compatible coding agents.

The root `AGENTS.md` applies to the whole repository. If a nested `AGENTS.md` is
ever added, follow the nearest file for that subtree without weakening these
repository-wide safety rules.

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

Standalone MCP servers, runtime services, credentials, or dependency-heavy
tools belong in a separate repository. See
[`docs/infrastructure.md`](docs/infrastructure.md) for the full boundary and
lifecycle design.

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
- Update `README.md` when discoverability, installation, or the public project
  shape changes.
- Update `CHANGELOG.md` for user-visible skill, documentation, tooling, or
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

- Keep commits atomic and exclude unrelated formatting or cleanup.
- Write concise, descriptive commit subjects. Conventional Commit prefixes may
  be used when helpful but are not enforced.
- Direct pushes to `main` are allowed in this personal repository when the user
  requests them.

## Verification

Run checks that are specific to the skill or helper being changed when they
exist. Before handoff, inspect `git status --short`, run `git diff --check`, and
review the final diff. Report what was changed, what was verified, and any check
that could not be run.
