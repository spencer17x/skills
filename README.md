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
    agents/      # optional
```

Only create `references/`, `scripts/`, `assets/`, or `agents/` when the skill
actually needs them. Do not create category folders under `skills/` by default;
keep all skills directly under `skills/<skill-name>/`.

## Available Skills

| Skill | Description |
| --- | --- |
| `figma-ui` | Implement UI from Figma or visual references with project tokens, component reuse, flex-first layout, explicit sizing decisions, and high visual fidelity. |
| `resume` | Create, revise, tailor, review, or export resume materials with ownership, evidence, impact, and interview-ready positioning. |
| `workflow-insights` | Review recent work and suggest reusable skills, subagents, automations, or deliberate skips for repeated workflows. |

## Conventions

- Keep each skill in its own folder with a required `SKILL.md`.
- Use lowercase kebab-case names for skill folders.
- Keep the folder name and the `name` field in `SKILL.md` aligned.
- Use one primary language per skill; do not mix Chinese and English in the
  same skill unless the skill explicitly handles bilingual content.
- Put detailed reference material in a skill's `references/` folder.
- Put deterministic helper scripts in a skill's `scripts/` folder.
- Put templates or reusable output files in a skill's `assets/` folder.
- Put agent-specific metadata or prompts in a skill's `agents/` folder.
- Do not add standalone MCP servers here. Keep only small deterministic helpers
  that directly support a specific skill.

See [`docs/skill-conventions.md`](docs/skill-conventions.md) for the working
rules for adding and updating skills.

Repository governance and automation boundaries are described in
[`AGENTS.md`](AGENTS.md) and
[`docs/infrastructure.md`](docs/infrastructure.md). New commits follow
[`docs/commit-conventions.md`](docs/commit-conventions.md).

## Installation

Use CLI-first installation instructions from
[`docs/quick-install.md`](docs/quick-install.md). Manual copy and symlink
commands are documented there as fallback paths for agents without a registry or
installer.

## Versioning

Track source changes in [`CHANGELOG.md`](CHANGELOG.md). Use Git tags or commit
SHAs to pin installs. Do not add hand-maintained version fields to source
`SKILL.md` frontmatter.

## Validation

Run the repository validator after changing skills, agent metadata, scripts, or
Markdown links:

```bash
scripts/validate-skills
scripts/test-validate-skills
scripts/test-validate-commit-message
```

GitHub Actions runs the same validation and regression tests on pull requests
and pushes to `main`. It also checks pull request titles and new non-merge commit
messages.
