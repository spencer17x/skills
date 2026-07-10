---
name: resume
description: Use when creating, rewriting, tailoring, reviewing, or exporting resumes, CVs, professional profiles, or job-application resume variants from uploaded resumes, rough experience notes, skills, target roles, or job descriptions.
---

# Resume

## Goal

Rewrite vague, responsibility-based resume material into concise, truthful, evidence-driven, ownership-focused resume content that can survive recruiter screening and technical follow-up questions.

Use this skill for software engineering, frontend, backend, full-stack, AI, Agent, QA, DevOps, data, Web3, product engineering, technical lead, and related technical roles.

The goal is not to add buzzwords. The goal is to make the resume prove what the candidate actually owned, solved, shipped, improved, or validated.

For detailed guidance, examples, and role-specific patterns, use:

- [`references/guide.md`](references/guide.md)
- [`references/ai-agent-example.md`](references/ai-agent-example.md)

## Output Preferences

Before producing a final resume file or file-ready draft, confirm missing output preferences in one concise question:

- Output format. Default: PDF.
- Content length. Default: 2 pages.
- Language version. Default: English.

Do not ask again when the user already specified these preferences. If the user asks to proceed without more questions, use the defaults and state them briefly.

Keep each resume deliverable in the selected language unless the user explicitly asks for a bilingual or multilingual version.

## Inputs

Accept any combination of:

- Uploaded or pasted resumes.
- Self-introductions or rough career notes.
- Company, work, project, or skill notes.
- GitHub, portfolio, blog, or open-source links.
- Target roles or job descriptions.
- Recruiter feedback, interview feedback, or desired resume direction.

If the user has provided enough information, do not block progress with excessive questions. Make a best-effort rewrite and mark unknown details with placeholders in the selected language, such as `[add concrete metric]`, `[add launch scope]`, or `[add verified user volume]`. Any deliverable that still contains placeholders is a draft, not a final or export-ready resume.

## Core Rules

1. Replace weak claims with evidence.
   - Weak: "familiar with", "understands", "participated in", "helped with", "responsible for development".
   - Strong: "owned", "designed", "implemented", "shipped", "optimized", "reduced", "improved", "validated", plus concrete evidence.

2. Use the impact formula:

   ```text
   Business context + ownership + technical solution + problem solved + result
   ```

3. Prefer shipped, validated, or observable outcomes.
   - Use real metrics when available.
   - Use honest qualitative impact when metrics are missing.
   - Never fabricate metrics, scale, titles, dates, employers, production usage, ownership, design decisions, implementation details, reliability mechanisms, or outcomes.
   - Do not turn a likely implication into a stated fact. For example, Redis does not prove conversation continuity, and RAG does not prove grounded answers or reduced hallucination without user evidence.

4. Tailor the resume to the target role or job description.
   - Put the most relevant skills and projects first.
   - Translate older experience into target-role value.
   - Remove or compress low-signal content.

5. Make bullets interview-ready.
   - Each major claim should survive follow-up questions about scope, design, trade-offs, problems, solutions, and results.

## Required Workflow

### 1. Understand the target

Identify the role direction, seniority, domain, selected language, page limit, output format, and whether this is a general resume or a job-description-tailored version.

When a job description is provided, extract required skills, preferred skills, domain signals, ownership expectations, and hidden hiring signals.

### 2. Extract candidate evidence

Mine the user's material for:

- Real shipped systems or validated projects.
- Modules, workflows, or areas the candidate owned.
- Complex technical problems and decisions.
- Performance, reliability, automation, or quality improvements.
- Open-source contributions and what they prove.
- Metrics, scale, usage, or observable outcomes.

### 3. Diagnose and prioritize

Flag only the most important issues: unclear ownership, weak verbs, missing impact, overloaded skills, projects that sound like demos, language inconsistency, or mismatches with the target role.

### 4. Rewrite the resume

Rewrite the relevant sections:

- Summary: clear positioning and differentiator.
- Skills: grouped by target-role relevance.
- Work experience: ownership, systems, problems, solutions, results.
- Projects: scenario, ownership, architecture, implementation, reliability, result.
- Open source: explain what the contribution proves, not only the link.

### 5. Tailor to the job description when needed

Map job requirements to resume evidence:

```text
Job requirement: ...
Resume evidence: ...
Match strength: Strong / Medium / Weak
Recommended emphasis: ...
Risks or gaps: ...
```

Then reorder and rewrite the resume around the strongest matches.

### 6. Check interview risk

After rewriting, call out risks such as overclaimed ownership, unverifiable metrics, technologies the candidate may not defend, missing shipped evidence, likely follow-up questions, or claims that exceed the source material.

## Output Modes

Choose based on the user's request:

1. Resume diagnosis.
2. Section rewrite.
3. Complete resume rewrite.
4. Job-description-tailored resume.
5. Experience mining from rough notes.
6. Interview risk checklist.
7. Suggested metrics to add.
8. Export-ready resume file.

For complete resume rewrites, default to a 2-page English PDF when the user does not specify output preferences.

## Final Quality Bar

Before labeling any deliverable final or export-ready:

1. Search for unresolved placeholders, bracketed prompts, invented names, inferred dates, and unverified metrics. None may remain.
2. Trace every ownership, architecture, implementation, reliability, outcome, and impact claim to user-provided evidence.
3. If required facts are still missing, deliver a clearly labeled draft plus a concise missing-information list. Do not describe it as final or export-ready.

The optimized resume should make the reader think:

```text
This candidate has actually owned real work, solved real problems, and delivered meaningful results.
```

Not:

```text
This candidate only listed technologies, watched tutorials, or built toy demos.
```
