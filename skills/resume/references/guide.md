# Resume Optimization Guide

Detailed reference for the `resume` skill.

All examples in this guide are generic and illustrative. Do not encode a specific user's personal work history, companies, projects, or open-source identity into this skill.

## Core Principle

A strong resume should not only say what the candidate knows. It should show:

1. What the candidate owned.
2. What problem they solved.
3. What technical decisions they made.
4. What they shipped or validated.
5. What measurable or observable results they produced.

Avoid resumes that only list technologies or responsibilities. Prefer resumes that show real execution and impact.

## Weak vs Strong Language

### Avoid overusing weak verbs

- familiar with
- understands
- knows
- participated in
- helped with
- used
- maintained
- built
- integrated
- responsible for development

These phrases are not always wrong, but they are weak when used alone.

### Prefer ownership verbs

Use stronger verbs when accurate:

- owned
- designed
- implemented
- shipped
- launched
- optimized
- refactored
- integrated
- improved
- reduced
- increased
- led
- maintained
- productionized
- stabilized
- automated
- debugged
- delivered
- validated

## Resume Bullet Formula

Use this formula:

```text
Business context + ownership + technical solution + challenge + result
```

Example:

```text
Owned X for Y scenario, implemented Z to solve A, resulting in B.
```

## Project Rewrite Checklist

Before adding a project to a resume, check whether it answers:

1. What business or user problem did this project solve?
2. What part did the candidate personally own?
3. What concrete technical work did the candidate do?
4. What was difficult about the project?
5. What trade-offs or design decisions were made?
6. How was reliability, performance, quality, or maintainability handled?
7. Was it shipped, launched, used internally, validated as a proof of concept, or only a demo?
8. What measurable or observable result did it produce?

If a project cannot answer most of these, either rewrite it with more detail or remove it.

## Impact Types

Use real metrics when available.

### Business impact

- Revenue increase.
- Cost reduction.
- Conversion improvement.
- User growth.
- Manual workload reduction.
- Operational efficiency improvement.

### Engineering impact

- Latency reduction.
- Performance improvement.
- Build time reduction.
- Error rate reduction.
- Test coverage improvement.
- Deployment frequency improvement.
- Maintenance cost reduction.
- Code complexity reduction.

### Product impact

- Feature launch.
- Workflow simplification.
- User experience improvement.
- Customer delivery.
- Internal adoption.
- Support ticket reduction.

### Quality impact

- Stability improvement.
- Regression prevention.
- Incident reduction.
- Monitoring coverage.
- Automated testing.
- Failure recovery.

If exact numbers are unavailable, use truthful qualitative impact:

- Supported real customer delivery.
- Completed internal proof-of-concept validation.
- Supported a core business workflow.
- Improved future iteration speed.
- Reduced maintenance cost.
- Improved debugging efficiency.
- Enabled reuse across multiple projects.

Never fabricate metrics.

## Rewrite Examples

### Weak technology listing

Bad:

```text
Familiar with React, Vue, and TypeScript; participated in admin system development.
```

Good:

```text
Owned core pages for an internal configuration system, implementing configuration management, data search, and permission-control modules with Vue 3 and TypeScript, and extracted reusable form, table, and modal components to speed up delivery of future business pages.
```

### Weak project ownership

Bad:

```text
Participated in approval system development and handled some API integration.
```

Good:

```text
Owned the approval list and detail modules, designed front-end interactions for approval-state transitions, exceptional states, and user feedback, and aligned API contracts with backend engineers to deliver the core approval workflow reliably.
```

### Weak performance description

Bad:

```text
Optimized page performance and improved user experience.
```

Good:

```text
Refactored state updates and split high-frequency rendering components for large data-table filtering and batch operations, reducing unnecessary rerenders and improving core interaction responsiveness by [add verified percentage].
```

### Weak AI project description

Bad:

```text
Familiar with RAG and built a knowledge-base Q&A system.
```

Good:

```text
Designed and implemented a knowledge-base Q&A pipeline covering document chunking, embedding, retrieval, answer synthesis, source citation, result validation, and fallback handling to improve answer trustworthiness and reduce hallucination risk.
```

### Weak backend description

Bad:

```text
Responsible for API development and system maintenance.
```

Good:

```text
Designed and optimized core business APIs for high-concurrency query scenarios, introduced caching and pagination to reduce database pressure, and improved production troubleshooting through structured logging, monitoring, and alerting.
```

## Role Translation Rules

Translate existing experience into the language of the target role.

### Frontend to product engineering

- Page development -> user workflow implementation.
- Component extraction -> reusable UI system.
- State management -> complex interaction state modeling.
- Performance optimization -> user experience and responsiveness improvement.
- End-to-end testing -> product quality assurance.

### Backend to automation or AI engineering

- API design -> tool schema or integration contract design.
- Service governance -> tool reliability and fallback.
- Cache strategy -> context, retrieval, or response cache.
- Circuit breaker -> timeout and graceful degradation.
- Logs and monitoring -> observability.
- Workflow orchestration -> multi-step workflow design.

### Business systems to complex system engineering

- State transitions -> state machine and lifecycle modeling.
- Real-time data -> streaming, synchronization, or consistency handling.
- Permissions, risk controls, and exceptional states -> edge case handling and fallback.
- End-to-end testing -> critical path validation.
- Multi-role processes -> workflow and permission modeling.

### Open source to engineering credibility

- Pull request contribution -> ability to read large codebases.
- Organization membership -> trusted community participation.
- Documentation contribution -> ecosystem collaboration.
- Tooling contribution -> infrastructure and developer experience awareness.

Only use open-source examples when the user has provided real contribution evidence.

## Section Guidelines

### Summary

The summary should answer:

```text
Who is this candidate?
What type of role are they targeting?
What is their strongest differentiator?
What real systems or projects have they shipped?
```

Avoid generic phrases like:

```text
Passionate about technology, fast learner, and able to work under pressure.
```

Prefer concrete positioning:

```text
Frontend and full-stack engineer experienced in delivering complex business systems and engineering platforms, with strengths in decomposing workflows into maintainable architecture and improving delivery quality through performance optimization, automated testing, and engineering tooling.
```

### Skills

Skills should be grouped by relevance. Do not list every technology equally.

Useful categories:

- Primary stack.
- Secondary stack.
- Domain-specific skills.
- Tools and infrastructure.

### Work experience

Each work experience should include:

- Scope.
- Ownership.
- Core systems or modules.
- Technical depth.
- Results.

Avoid writing only daily duties.

### Projects

A good project description should include:

- Scenario.
- Ownership.
- Architecture or workflow.
- Key technical decisions.
- Reliability or quality strategy.
- Result.

### Open source

Open-source contributions should not be written only as links. Explain what they prove, but only when the user has provided real evidence:

- Large codebase reading ability.
- Community collaboration.
- Tooling knowledge.
- Documentation quality.
- Engineering credibility.

## Interview-Oriented Writing

A good resume should guide the interview toward the candidate's strengths.

When writing a bullet, ask:

```text
If the interviewer asks a follow-up question, can the candidate explain it deeply?
```

Strong bullets naturally invite useful follow-up questions:

- Why did you choose this design?
- How did you handle failure cases?
- How did you measure the improvement?
- What trade-offs did you make?
- What would you improve next?

Avoid bullets that invite dangerous follow-ups:

- "You said you are familiar with this. What exactly did you use?"
- "Which part did you personally own?"
- "Was this project launched?"
- "Where did this metric come from?"
- "Was this your work or the team's work?"

## Red Flags

Fix these issues when reviewing a resume:

1. Too many weak verbs.
2. Too many technology names without project evidence.
3. No clear ownership.
4. No shipped or validated result.
5. No measurable or observable impact.
6. Projects sound like toy demos.
7. Work experience does not match the target role.
8. Important achievements are buried.
9. Old experience is not translated into target-role value.
10. The resume cannot survive one technical follow-up question.
