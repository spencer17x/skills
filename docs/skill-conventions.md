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
```

Only create `references/`, `scripts/`, or `assets/` when the skill actually
needs them.

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

## MCP Boundary

Do not put standalone MCP servers in this repository. Create a separate MCP or
agent-tools repository when a tool has its own runtime, dependencies, credentials,
or tests.

Small deterministic helpers that support one skill can live under that skill's
`scripts/` directory.
