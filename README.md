# skills

Personal AI agent skills collection.

This repository is organized as a lightweight skills library: concise `SKILL.md`
files live under `skills/`, while shared conventions and maintenance scripts stay
at the repo root.

## Structure

```text
skills/
  engineering/   Coding workflows, review habits, debugging, testing
  writing/       Voice, editing, drafting, and publishing workflows
  productivity/  Planning, handoffs, notes, and recurring work
  research/      Source evaluation, synthesis, and reading workflows
  personal/      Personal preferences and reusable context
  in-progress/   Draft skills that are not ready to install by default
  deprecated/    Archived skills kept for reference
```

## Conventions

- Keep each skill in its own folder with a required `SKILL.md`.
- Use lowercase kebab-case names for skill folders.
- Put detailed reference material in a skill's `references/` folder.
- Put deterministic helper scripts in a skill's `scripts/` folder.
- Put templates or reusable output files in a skill's `assets/` folder.
- Do not add MCP servers here unless they are private implementation details of
  a specific skill.

See [`docs/skill-conventions.md`](docs/skill-conventions.md) for the working
rules for adding and updating skills.
