# Skill Conventions

Use this repository as a collection of focused AI agent skills. Keep it mostly
text-based and avoid mixing in standalone MCP servers.

## Repository Layout

- `skills/engineering/`: coding workflows, review habits, debugging, testing.
- `skills/writing/`: voice, editing, drafting, publishing.
- `skills/productivity/`: planning, handoffs, notes, recurring work.
- `skills/research/`: source evaluation, synthesis, reading workflows.
- `skills/personal/`: personal preferences and reusable context.
- `skills/in-progress/`: draft skills that are not ready to install by default.
- `skills/deprecated/`: archived skills kept for reference.
- `scripts/`: repository maintenance scripts only.

## Skill Layout

Each skill should use this shape:

```text
skill-name/
  SKILL.md
  references/
  scripts/
  assets/
```

Only create `references/`, `scripts/`, or `assets/` when the skill actually
needs them.

## Naming

- Use lowercase kebab-case for skill folder names.
- Prefer short, action-oriented names, such as `review-pr` or `draft-handoff`.
- Keep the folder name and the `name` field in `SKILL.md` aligned.

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
