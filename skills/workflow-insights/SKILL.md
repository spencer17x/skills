---
name: workflow-insights
description: Use when reviewing recent sessions, memories, histories, notes, or activity logs to find repeated manual work that may deserve a reusable skill, custom subagent, automation, or deliberate skip.
---

# Workflow Insights

## Overview

Turn repeated work into the smallest useful reusable asset. Prefer extending
what exists over creating something new, and prefer skipping weak candidates over
creating speculative clutter.

## Evidence Order

Use the best available evidence in this order:

1. Recent Codex sessions and task summaries.
2. Codex Memories and rollout summaries that reveal repeated patterns.
3. Chronicle or other activity history, if enabled, for discovery only.
4. Existing skills, custom agents, and automations.
5. Source systems linked from the evidence when an important detail needs
   confirmation.

Do not treat activity history as enough by itself for sensitive or consequential
actions. Confirm important details in the relevant source system whenever
possible.

For Codex session evidence, prefer the bundled
`scripts/codex-session-task-inventory.sh` helper to build a compact TSV of
session date, source, role, project, filename, and first real task prompt. Use it
for discovery only; read full transcripts only when needed to confirm an
important, non-sensitive detail.

## Candidate Test

Only recommend packaging a workflow when it satisfies all of these:

- It happened at least twice, or is clearly likely to recur and costly to repeat.
- It has stable inputs, a repeatable procedure, and a clear output or stopping
  condition.
- Packaging it would improve speed, quality, consistency, or reliability.
- It is not already covered well enough by an existing skill, agent, automation,
  script, template, checklist, or repo convention.

Skip candidates that are one-off, vague, poorly evidenced, overly broad,
sensitive, or mostly judgment calls with no repeatable procedure.

## Choose The Form

- **Extend existing**: use when a current skill, agent, automation, or template
  already covers most of the workflow.
- **Skill**: use for reusable workflows, playbooks, standards, or source-aware
  procedures that an agent should follow on demand.
- **Custom subagent**: use for bounded specialist roles, investigations, audits,
  reviews, or research tasks that can be delegated independently.
- **Automation**: use for scheduled or recurring checks, reports, reminders,
  monitors, or follow-ups with a clear cadence and stop condition.
- **Skip**: use when the evidence or payoff is not strong enough.

Choose the smallest form that solves the repeated work. Do not create overlapping
or broad "do everything" assets.

## Confirmation Gate

Before creating, extending, installing, or modifying any skill, custom subagent,
automation, script, template, repo asset, or user-local asset, stop after the
shortlist and ask for explicit user confirmation. Do not treat a recommendation
as permission to act. If the user already asked to create or update a specific
asset, treat that as confirmation only for that named scope.

## Workflow

1. Define the review window, defaulting to the last 30 days or all available
   history if shorter.
2. Inventory existing reusable assets before proposing new ones.
3. Gather evidence from the available sources and note concrete dates or sessions
   for each candidate.
4. Produce a compact shortlist with:
   - repeated workflow
   - supporting evidence and dates
   - frequency and confidence
   - recommended form
   - why it is or is not worth packaging
5. After explicit user confirmation, create or extend only the confirmed
   high-confidence missing items.
6. Keep created assets narrow, practical, source-aware, and easy to validate.
7. Finish with:
   - what was created or extended
   - what was deliberately skipped
   - what needs more evidence before packaging

## Guardrails

- Ask before reading private sources that are not already authorized by the user.
- Do not create assets solely because a prompt suggested a category.
- Do not duplicate existing assets; extend or reference them.
- Do not create or modify reusable assets from a shortlist until the user
  explicitly confirms the specific scope.
- Do not package sensitive personal, financial, medical, legal, or credential
  workflows unless the user explicitly asks and the boundaries are clear.
- Prefer one polished high-confidence asset over many half-formed ones.
