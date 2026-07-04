# skills

Personal AI agent skills collection.

This repository is organized as a lightweight skills library: concise `SKILL.md`
files live under `skills/`, while shared conventions and maintenance scripts stay
at the repo root.

## Structure

Start with a flat skill layout:

```text
skills/
  figma-ui/
    SKILL.md
    references/
      implementation-guide.md
```

Each skill should live directly under `skills/<skill-name>/` while the library is
small. Introduce category folders later only when the number of skills grows and
clear groupings emerge.

Possible future categories include:

```text
skills/
  engineering/
  writing/
  productivity/
  research/
  personal/
  in-progress/
  deprecated/
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
