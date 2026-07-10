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
TAG_OR_SHA=your-tag-or-commit-sha
gh skill install spencer17x/skills "workflow-insights@$TAG_OR_SHA"
gh skill install spencer17x/skills workflow-insights --pin "$TAG_OR_SHA"
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

Pinned skills are intentionally skipped by `gh skill update`. To move a skill
to a new pinned version, reinstall it with `--force --pin`; this overwrites the
installed skill files, so back up local changes first. To return to normal
updates, clear the pin explicitly:

```bash
NEW_TAG_OR_SHA=your-new-tag-or-commit-sha
gh skill install spencer17x/skills workflow-insights --force --pin "$NEW_TAG_OR_SHA"
gh skill update workflow-insights --unpin
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

The installed skill is available on the next turn. Restart Codex only if it is
not discovered there.

## Claude Code

This repository is not currently published as a Claude Code plugin marketplace.
Until it is, install skills with the supported local skills directories.

User-wide install:

```bash
set -euo pipefail
mkdir -p ~/.claude/skills
checkout_dir="$(mktemp -d)"
trap 'rm -rf "$checkout_dir"' EXIT
git clone --depth 1 https://github.com/spencer17x/skills.git "$checkout_dir/repo"
cp -R "$checkout_dir/repo/skills/workflow-insights" ~/.claude/skills/
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
mkdir -p .agents/skills
cp -R skills/workflow-insights .agents/skills/
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
head -20 .agents/skills/workflow-insights/SKILL.md
```

In a new agent session, mention the skill name or describe a matching task. The
agent should load the skill based on its `description` frontmatter.

## Uninstall

Remove the installed skill directory:

```bash
rm -rf "${CODEX_HOME:-$HOME/.codex}/skills/workflow-insights"
rm -rf ~/.claude/skills/workflow-insights
rm -rf .agents/skills/workflow-insights
rm -rf .github/skills/workflow-insights  # legacy Copilot path from older docs
```

Restart the agent after uninstalling if it caches skill metadata.
