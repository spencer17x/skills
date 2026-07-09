# Agent Instructions

This repository is a personal Agent Skills library. Keep changes narrow,
text-first, and easy to install across compatible coding agents.

## Repository Shape

- Installable skills live directly under `skills/<skill-name>/`.
- Do not add category directories under `skills/` unless the repository
  conventions are updated first.
- Root `scripts/` is for repository maintenance only.
- Standalone MCP servers, runtime services, credentials, or dependency-heavy
  tools should live in a separate repository.

Each skill may contain:

```text
skills/<skill-name>/
  SKILL.md
  references/  # optional detailed material
  scripts/     # optional deterministic helpers for that skill
  assets/      # optional templates or reusable files
  agents/      # optional agent-specific metadata or prompts
```

## Skill Rules

- Keep skill folder names lowercase kebab-case.
- Keep the folder name and `SKILL.md` frontmatter `name` aligned.
- Keep source `SKILL.md` frontmatter to `name` and `description`.
- Do not add hand-maintained per-skill versions to `SKILL.md`; use Git tags and
  `CHANGELOG.md` for source versioning.
- Use one primary language per skill. Keep frontmatter, body, references,
  script help text, and `agents/` metadata in that language unless the skill is
  explicitly bilingual or multilingual.
- Move large examples, schemas, policies, or style guides into `references/`.
- Put deterministic reusable helpers in the skill's `scripts/` directory.

## Installation Documentation

- Prefer CLI-first install instructions.
- Keep manual copy or symlink instructions as fallback/debug/dev paths.
- Do not invent agent commands. If an agent does not have a confirmed install
  command, say so and provide the supported filesystem path.
- Include verify, update, uninstall, and version pinning notes when installation
  instructions change.

## Versioning

- Track human-readable changes in `CHANGELOG.md`.
- Use Git tags or commit SHAs for install pinning.
- If an external installer writes provenance metadata into installed
  `SKILL.md` files, do not copy that generated metadata back into source skills
  unless the repository convention is intentionally changed.

## Verification

After changing skills, documentation links, agent metadata, or scripts, run:

```bash
scripts/validate-skills
```

For shell helper changes, also make sure the script's own happy path still runs
with a small fixture when practical.
