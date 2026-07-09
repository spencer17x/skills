# Quick Install

This repository follows the Agent Skills folder format. Install one skill at a
time unless your agent's installer explicitly supports selecting multiple
skills.

Repository: `spencer17x/skills`

## Version Pinning

Prefer pinning installs to a Git tag or commit SHA when the installer supports
it. Use `main` only when you intentionally want the latest source state.

Examples:

```bash
gh skill install spencer17x/skills workflow-insights@<tag-or-sha>
gh skill install spencer17x/skills workflow-insights --pin <tag-or-sha>
```

For tools that install from a GitHub directory URL, replace `main` with a tag or
commit SHA:

```text
https://github.com/spencer17x/skills/tree/<tag-or-sha>/skills/workflow-insights
```

## GitHub CLI / Copilot / Compatible Agents

Use this when your GitHub CLI includes `gh skill`.

Preview before installing:

```bash
gh skill preview spencer17x/skills workflow-insights
```

Install a skill:

```bash
gh skill install spencer17x/skills workflow-insights
```

Install for a specific agent and scope when supported:

```bash
gh skill install spencer17x/skills workflow-insights --agent claude-code --scope user
```

Update installed skills:

```bash
gh skill update
gh skill update workflow-insights
gh skill update --all
```

## Codex

Inside Codex, use the built-in skill installer with a GitHub directory URL:

```text
$skill-installer install https://github.com/spencer17x/skills/tree/main/skills/workflow-insights
```

Install another skill by changing the final directory name:

```text
$skill-installer install https://github.com/spencer17x/skills/tree/main/skills/figma-ui
$skill-installer install https://github.com/spencer17x/skills/tree/main/skills/resume
```

Restart Codex after installing new skills so the metadata is loaded.

## Claude Code

This repository is not currently published as a Claude Code plugin marketplace.
Until it is, install skills with the supported local skills directories.

User-wide install:

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/spencer17x/skills.git /tmp/spencer17x-skills
cp -R /tmp/spencer17x-skills/skills/workflow-insights ~/.claude/skills/
```

Project install:

```bash
mkdir -p .claude/skills
cp -R /path/to/skills/skills/workflow-insights .claude/skills/
```

If this repository is later published as a Claude Code plugin marketplace, use
Claude Code plugin commands instead:

```text
/plugin marketplace add spencer17x/skills
/plugin install <plugin-name>@<marketplace-name>
```

## Manual Fallback

Use manual copy or symlinks when a target agent does not support a registry or
installer yet.

Codex:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/workflow-insights "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Claude Code:

```bash
mkdir -p ~/.claude/skills
cp -R skills/workflow-insights ~/.claude/skills/
```

VS Code / GitHub Copilot project scope:

```bash
mkdir -p .github/skills
cp -R skills/workflow-insights .github/skills/
```

For local development, symlink from this checkout so edits are picked up without
copying:

```bash
ln -s "$PWD/skills/workflow-insights" "${CODEX_HOME:-$HOME/.codex}/skills/workflow-insights"
```

## Verify

Check that the installed skill has a readable `SKILL.md`:

```bash
head -20 "${CODEX_HOME:-$HOME/.codex}/skills/workflow-insights/SKILL.md"
head -20 ~/.claude/skills/workflow-insights/SKILL.md
```

In a new agent session, mention the skill name or describe a matching task. The
agent should load the skill based on its `description` frontmatter.

## Uninstall

Remove the installed skill directory:

```bash
rm -rf "${CODEX_HOME:-$HOME/.codex}/skills/workflow-insights"
rm -rf ~/.claude/skills/workflow-insights
rm -rf .github/skills/workflow-insights
```

Restart the agent after uninstalling if it caches skill metadata.
