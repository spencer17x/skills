# Skill Conventions

Use this repository as a collection of focused AI agent skills. Keep it mostly
text-based and avoid mixing in standalone MCP servers.

## Repository Layout

Use a flat layout for skills:

```text
skills/
  skill-name/
    SKILL.md
    references/  # optional
    scripts/     # optional
    assets/      # optional
    agents/      # optional
scripts/
```

All installable skills should live directly under `skills/<skill-name>/`.
Do not create category folders such as `skills/engineering/` or
`skills/writing/` by default. If the repository becomes large enough to need
navigation help, add an index or metadata first before introducing nested
categories.

The root-level `scripts/` directory is reserved for repository maintenance
scripts only.

## Skill Layout

Each skill should use this shape:

```text
skills/skill-name/
  SKILL.md
  references/  # optional
  scripts/     # optional
  assets/      # optional
  agents/      # optional
```

Only create `references/`, `scripts/`, `assets/`, or `agents/` when the skill
actually needs them.

## Naming

- Use lowercase kebab-case for skill folder names.
- Prefer short, action-oriented names, such as `review-pr` or `draft-handoff`.
- Keep the folder name and the `name` field in `SKILL.md` aligned.

## Language Consistency

- Choose one primary language for each skill and keep the frontmatter, body,
  references, scripts help text, and `agents/openai.yaml` metadata in that
  language.
- Do not mix Chinese and English in the same skill unless the skill explicitly
  handles bilingual content, translation, localization, or multilingual test
  cases.
- When a skill produces user-facing artifacts, ask or infer the requested output
  language and keep the artifact consistent with that language.

## SKILL.md

- Keep the YAML frontmatter to `name` and `description`.
- Put trigger conditions in `description`, because that is what the agent sees
  before loading the full skill body.
- Keep the body concise and procedural.
- Move large schemas, examples, policies, or style guides into `references/`.
- Do not add hand-maintained version fields to source `SKILL.md` frontmatter.
  Use Git tags and `CHANGELOG.md` for source versioning.
- If an external installer writes provenance metadata into installed skill
  frontmatter, do not copy that generated metadata back into source skills unless
  this convention is intentionally updated.

## Agent Metadata

Use `agents/` only for agent-specific metadata, prompts, UI hints, or adapter
files that are not part of the portable `SKILL.md` contract.

Examples:

- `agents/openai.yaml`
- `agents/claude.yaml`

Keep agent metadata in the same primary language as the skill.

## Installation Docs

- Prefer CLI-first install instructions.
- Keep manual copy and symlink commands as fallback or local-development paths.
- Include verify, update, uninstall, and version pinning notes when install
  behavior changes.
- Do not document unconfirmed agent commands.

## MCP Boundary

Do not put standalone MCP servers in this repository. Create a separate MCP or
agent-tools repository when a tool has its own runtime, dependencies, credentials,
or tests.

Small deterministic helpers that support one skill can live under that skill's
`scripts/` directory.

## Validation

Run the repository validator after changing skills, metadata, scripts, or
Markdown links:

```bash
scripts/validate-skills
scripts/test-validate-skills
```
