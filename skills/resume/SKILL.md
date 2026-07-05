---
name: resume
description: Use this skill when optimizing, rewriting, reviewing, or tailoring a resume from an uploaded resume, pasted resume, self-introduction, work history, project notes, skills, GitHub/portfolio links, target roles, or job descriptions. Focus on evidence-driven bullets with clear ownership, concrete technical work, shipped or validated outcomes, measurable impact, and interview-ready positioning.
---

# Resume

## Goal

Rewrite vague, responsibility-based resumes into evidence-driven, ownership-focused, impact-oriented resumes that can survive recruiter screening and technical follow-up questions.

Use this skill for software engineering, frontend, backend, full-stack, AI, Agent, QA, DevOps, data, Web3, product engineering, technical lead, and related technical roles.

The goal is not to add buzzwords. The goal is to make the resume prove what the candidate actually owned, solved, shipped, improved, or validated.

For detailed guidance, examples, and role-specific patterns, use:

- [`references/guide.md`](references/guide.md)
- [`references/ai-agent-example.md`](references/ai-agent-example.md)

## Inputs

Accept any combination of:

- Uploaded or pasted resumes.
- Self-introductions or rough career notes.
- Company, work, project, or skill notes.
- GitHub, portfolio, blog, or open-source links.
- Target roles or job descriptions.
- Recruiter feedback, interview feedback, or desired resume direction.

If the user has provided enough information, do not block progress with excessive questions. Make a best-effort rewrite and mark unknown details with placeholders such as `[补充具体指标]` or `[补充上线范围]`.

## Core Rules

1. Replace weak claims with evidence.
   - Weak: “熟悉 / 了解 / 掌握 / 参与 / 负责开发”.
   - Strong: “负责 / 独立设计 / 实现 / 上线 / 优化 / 交付” plus concrete evidence.

2. Use the impact formula:

   ```text
   业务场景 + ownership + 技术方案 + 解决的问题 + 结果
   ```

3. Prefer shipped, validated, or observable outcomes.
   - Use real metrics when available.
   - Use honest qualitative impact when metrics are missing.
   - Never fabricate metrics, scale, titles, dates, production usage, or ownership.

4. Tailor the resume to the target role or JD.
   - Put the most relevant skills and projects first.
   - Translate older experience into target-role value.
   - Remove or compress low-signal content.

5. Make bullets interview-ready.
   - Each major claim should survive follow-up questions about scope, design, trade-offs, problems, solutions, and results.

## Required Workflow

### 1. Understand the target

Identify the role direction, seniority, domain, language, page limit, and whether this is a general resume or a JD-tailored version.

When a JD is provided, extract required skills, preferred skills, domain signals, ownership expectations, and hidden hiring signals.

### 2. Extract candidate evidence

Mine the user's material for:

- Real shipped systems or validated projects.
- Modules, workflows, or areas the candidate owned.
- Complex technical problems and decisions.
- Performance, reliability, automation, or quality improvements.
- Open-source contributions and what they prove.
- Metrics, scale, usage, or observable outcomes.

### 3. Diagnose and prioritize

Flag only the most important issues: unclear ownership, weak verbs, missing impact, overloaded skills, projects that sound like demos, or mismatches with the target role.

### 4. Rewrite the resume

Rewrite the relevant sections:

- Summary: clear positioning and differentiator.
- Skills: grouped by target-role relevance.
- Work experience: ownership, systems, problems, solutions, results.
- Projects: scenario, ownership, architecture, implementation, reliability, result.
- Open source: explain what the contribution proves, not only the link.

### 5. Tailor to JD when needed

Map JD requirements to resume evidence:

```text
JD 要求：...
简历证据：...
匹配度：强 / 中 / 弱
建议突出：...
风险或缺口：...
```

Then reorder and rewrite the resume around the strongest matches.

### 6. Check interview risk

After rewriting, call out risks such as overclaimed ownership, unverifiable metrics, technologies the candidate may not defend, missing shipped evidence, or likely follow-up questions.

## Output Modes

Choose based on the user's request:

1. Resume diagnosis.
2. Section rewrite.
3. Complete resume rewrite.
4. JD-tailored resume.
5. Experience mining from rough notes.
6. Interview risk checklist.
7. Suggested metrics to add.

For complete resume rewrites, output polished Markdown unless the user asks for PDF, DOCX, or another format.

## Final Quality Bar

The optimized resume should make the reader think:

```text
This candidate has actually owned real work, solved real problems, and delivered meaningful results.
```

Not:

```text
This candidate only listed technologies, watched tutorials, or built toy demos.
```
