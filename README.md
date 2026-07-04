# skills

Personal AI agent skills collection.

This repository is organized as a lightweight skills library: each skill lives as
a self-contained folder directly under `skills/`, while shared conventions and
maintenance scripts stay at the repo root.

## Structure

Use a flat skill layout:

```text
skills/
  <skill-name>/
    SKILL.md
    references/  # optional
    scripts/     # optional
    assets/      # optional
```

Only create `references/`, `scripts/`, or `assets/` when the skill actually
needs them. Do not create category folders under `skills/` by default; keep all
skills directly under `skills/<skill-name>/`.

## Available Skills

| Skill | Description |
| --- | --- |
| `figma-ui` | Implement UI from Figma or visual references with project tokens, component reuse, flex-first layout, explicit sizing decisions, and high visual fidelity. |
| `workflow-insights` | Review recent work and suggest reusable skills, subagents, automations, or deliberate skips for repeated workflows. |

## Conventions

- Keep each skill in its own folder with a required `SKILL.md`.
- Use lowercase kebab-case names for skill folders.
- Keep the folder name and the `name` field in `SKILL.md` aligned.
- Put detailed reference material in a skill's `references/` folder.
- Put deterministic helper scripts in a skill's `scripts/` folder.
- Put templates or reusable output files in a skill's `assets/` folder.
- Do not add MCP servers here unless they are private implementation details of
  a specific skill.

See [`docs/skill-conventions.md`](docs/skill-conventions.md) for the working
rules for adding and updating skills.
