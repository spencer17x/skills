# Commit Message Conventions

New commits use the
[Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)
structure with the project-specific types and checks below. The policy applies
from its introduction onward; existing history does not need to be rewritten.

## Format

```text
type(optional-scope)!: concise summary

Optional body explaining why the change is needed.

Optional-Footer: value
BREAKING CHANGE: migration or compatibility impact
```

The `!` marks a breaking change and may appear with or without a scope.

## Allowed Types

| Type | Use for |
| --- | --- |
| `feat` | A new skill or externally visible capability |
| `fix` | A defect, unsafe behavior, or incorrect instruction |
| `docs` | Documentation-only changes |
| `refactor` | Internal restructuring without intended behavior change |
| `perf` | A measurable performance improvement |
| `test` | Tests or fixtures without production behavior changes |
| `build` | Packaging, dependency, or build-system changes |
| `ci` | Continuous-integration configuration or automation |
| `chore` | Maintenance that fits no more specific type |
| `revert` | Reverting an earlier change |

Use `feat`, `fix`, or `docs` when one of them accurately describes the user
impact. Avoid using `chore` as a catch-all for meaningful behavior changes.

## Scope

Scope is optional. When present, it must be lowercase kebab-case.

- Use the skill folder name for a skill-specific change, such as `resume` or
  `workflow-insights`.
- Use a repository area for cross-cutting work, such as `infra`, `validation`,
  `release`, or `deps`.
- Omit scope when the change is truly repository-wide and a scope would add no
  useful information.

## Summary

- Describe one outcome in the imperative mood where the language supports it.
- Keep it specific and understandable without opening the diff.
- Do not end it with a period.
- Aim for 72 characters or fewer. The validator enforces a 100-character maximum
  for the complete header.
- English or Chinese summaries are both valid; keep each individual commit
  internally consistent.

## Body and Footers

Separate the body from the header with a blank line. Use the body to explain
motivation, constraints, or trade-offs rather than narrating the diff line by
line.

Footers follow the body after another blank line. Use `BREAKING CHANGE:` to
describe compatibility impact and the required migration. Issue references or
co-author trailers may use standard Git trailer syntax.

## Examples

```text
feat(resume): add role-fit review checklist
fix(workflow-insights): ignore injected wrapper messages
docs(infra): document release and validation flow
ci(validation): enforce commit message policy
chore(release): prepare the next tagged release
docs: 补充技能安装验证说明
```

A breaking change:

```text
feat(figma-ui)!: require explicit source-frame selection

BREAKING CHANGE: callers must identify the source frame before implementation.
```

Invalid examples:

```text
add resume skill
feature: add resume skill
feat(Resume): add scoring
feat: add scoring.
```

## Atomicity and Generated Commits

Each commit should contain one coherent change and its directly related tests or
documentation. Split unrelated cleanup into a separate commit. Do not leave
`fixup!` or `squash!` commits in the final branch history.

Hosting-provider or Git-generated merge commits beginning with `Merge ` are
exempt. Manually authored changes, including reverts, should use the normal
format. Pull request titles follow the same format because a squash merge may
turn the title into the final commit header.

## Validation

Validate a proposed header through standard input:

```bash
printf '%s\n' 'docs(infra): document repository boundaries' \
  | scripts/validate-commit-message
```

Validate an existing commit message file:

```bash
scripts/validate-commit-message .git/COMMIT_EDITMSG
```

Run the validator regression suite after changing the policy implementation:

```bash
scripts/test-validate-commit-message
```

To check prerequisites and enable validation for local commits in a fresh
checkout:

```bash
scripts/bootstrap
```

The bootstrap command is idempotent and refuses to replace an existing custom
hooks path. Integrate the validator with that setup manually when needed. CI
validates pull request titles and each new non-merge commit. The local hook is
optional, but it provides earlier feedback with the same validator used by CI.
The validator enforces header structure, allowed type, scope shape, maximum
length, terminal-period policy, and the blank line before a body. Reviewers are
responsible for semantic guidance such as atomicity and body quality.
