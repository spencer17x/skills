---
name: resume
description: Use this skill when optimizing, rewriting, reviewing, or tailoring a resume from an uploaded resume, pasted resume, self-introduction, work history, project notes, skills, GitHub/portfolio links, target roles, or job descriptions. Focus on evidence-driven bullets with clear ownership, concrete technical work, shipped or validated outcomes, measurable impact, and interview-ready positioning.
---

# Resume

## Goal

Rewrite vague, responsibility-based resumes into evidence-driven, ownership-focused, impact-oriented resumes that can survive recruiter screening and technical follow-up questions.

Use this skill for software engineering, frontend, backend, full-stack, AI, Agent, QA, DevOps, data, Web3, product engineering, technical lead, and related technical roles.

The goal is not to add buzzwords. The goal is to make the resume prove what the candidate actually owned, solved, shipped, improved, or validated.

Use [`references/ai-agent-example.md`](references/ai-agent-example.md) when optimizing AI Agent or AI application projects.

## Input Sources

Accept any combination of:

- Uploaded or pasted resumes.
- Self-introductions or rough career notes.
- Company, work, project, or skill notes.
- GitHub, portfolio, blog, or open-source links.
- Target roles or job descriptions.
- Recruiter feedback, interview feedback, or desired resume direction.

If important details are missing, ask at most a few high-value questions. If enough information is available, proceed with a best-effort rewrite and mark unknown details with placeholders instead of blocking progress.

## Core Principles

### Show evidence, not familiarity

Avoid relying on weak claims such as:

- 熟悉 / 了解 / 掌握
- 参与 / 协助
- 负责开发
- 搭建 / 接入 / 使用 / 维护

These words are not banned, but they are weak when used alone. Replace them with evidence:

```text
场景 + ownership + 具体实现 + 结果
```

Prefer strong verbs when truthful:

- 负责 / 独立负责 / 主导 / 设计 / 实现 / 落地 / 上线
- 重构 / 优化 / 封装 / 沉淀 / 推动 / 交付
- 排查 / 解决 / 降低 / 提升 / 保障

English equivalents:

- owned / designed / implemented / shipped / launched
- optimized / refactored / integrated / improved
- reduced / increased / led / maintained / productionized / stabilized / automated

### Use the impact formula

Use this structure for resume bullets:

```text
业务场景 + 我的 ownership + 技术方案 + 解决的问题 + 结果
```

Compact version:

```text
负责 / 主导 X，在 Y 场景下，通过 Z 方案解决 A 问题，最终提升 / 降低 / 支撑 / 保障 B。
```

English version:

```text
Owned X for Y scenario, implemented Z to solve A, resulting in B.
```

### Do not fabricate

Never invent:

- Company names, titles, dates, degrees, or certifications.
- Metrics, production usage, user scale, team size, or business impact.
- Open-source contribution status.
- Technical ownership or project outcomes.

When metrics are missing, use placeholders or honest qualitative outcomes:

```text
[补充具体指标]
[补充上线范围]
[补充使用规模]
[补充性能数据]
完成内部 PoC 验证
支持真实客户落地
支撑核心业务流程
提升后续迭代效率
降低维护成本
```

## Required Workflow

### 1. Understand the target

Identify the target role and screening context:

- Role direction and seniority.
- Target industry or domain.
- Resume language and page limit.
- Whether this is a general resume or a JD-tailored version.

If the user provides a JD, extract requirements, preferred skills, domain signals, ownership expectations, and hidden hiring signals.

### 2. Extract candidate evidence

From the user-provided material, identify:

- Real shipped systems or validated projects.
- Modules, workflows, or areas the candidate owned.
- Business-critical paths.
- Complex technical problems.
- Performance, reliability, automation, or quality improvements.
- Cross-team collaboration, mentoring, or leadership.
- Open-source contributions and what they prove.
- Metrics, scale, usage, or observable outcomes.

Do not only summarize the existing resume. Mine useful evidence from rough notes.

### 3. Diagnose resume problems

Flag issues such as:

- Too many weak verbs.
- Too many technologies without project evidence.
- Unclear ownership.
- No shipped, validated, or observable result.
- No measurable impact.
- Projects sound like toy demos.
- Work experience does not match the target role.
- Important achievements are buried.
- Skills are unordered or overloaded.
- Bullets cannot survive technical follow-up.

Give a concise diagnosis when the user asks for review. If the user asks for direct rewriting, rewrite directly.

### 4. Reposition the candidate

Write a positioning summary that answers:

- Who is this candidate?
- What role direction are they targeting?
- What is their strongest differentiator?
- What real systems or projects have they delivered?
- Why should this resume be considered?

Avoid generic claims such as “学习能力强” or “抗压能力强” unless backed by concrete evidence.

### 5. Rewrite skills

Group skills by relevance to the target role. Put the strongest and most relevant categories first.

Good categories include:

- Primary stack.
- Domain expertise.
- Infrastructure and tooling.
- Testing and quality.
- AI / data / automation.
- Open source and ecosystem.
- Business domain.

Keep the skill list concise. Make sure important skills have supporting work or project evidence elsewhere in the resume.

### 6. Rewrite work experience

For each company, include:

- Scope.
- Ownership.
- Core systems or modules.
- Technical depth.
- Problems solved.
- Results.

Avoid daily-duty bullets. Prefer ownership and delivery bullets.

Weak:

```text
参与项目开发，负责需求迭代。
```

Strong:

```text
负责订单列表与订单详情模块开发，围绕订单状态流转、异常状态展示和用户操作反馈设计前端交互逻辑，并与后端完成接口协议对齐，保障核心订单链路稳定交付。
```

### 7. Rewrite project experience

Each strong project should include:

1. Business scenario.
2. Candidate ownership.
3. Architecture or workflow.
4. Key technical implementation.
5. Challenge or bottleneck.
6. Solution.
7. Reliability, quality, or performance strategy.
8. Shipped, validated, or measurable result.

Before keeping a project, check whether the candidate can answer:

```text
你具体负责哪部分？
为什么这样设计？
遇到什么坑？
怎么解决？
结果怎么样？
上线了吗？
如果重做会怎么优化？
```

If the project cannot survive these questions, simplify it, add placeholders, or suggest removing it.

### 8. Add impact

Use metrics when they are real:

- 性能提升 40%+
- 构建耗时降低 30%
- 回归测试时间从 2 天降低到 0.5 天
- 人工处理成本降低 60%
- 日均处理 3000+ 会话
- 支持 10+ 业务场景
- 累计带教 7～8 名实习生

If exact metrics are missing, use truthful qualitative impact.

### 9. Tailor to JD

When a JD is provided, map requirements to evidence:

```text
JD 要求：...
简历证据：...
匹配度：强 / 中 / 弱
建议突出：...
风险或缺口：...
```

Then rewrite the summary, skills, work bullets, and project order to match the JD without fabricating experience.

### 10. Check interview risk

After rewriting, call out risks:

- Metrics that need explanation.
- Overclaimed ownership.
- Technologies the candidate may not be able to defend.
- Projects that sound like demos.
- Missing shipped or validation evidence.
- Follow-up questions the candidate should prepare.

## Role Translation Rules

Translate existing experience into the target role's language.

### Frontend to product engineering

- 页面开发 → user workflow implementation.
- 组件封装 → reusable UI system.
- 状态管理 → complex interaction state modeling.
- 性能优化 → responsiveness and user experience improvement.
- E2E 测试 → product quality assurance.

### Backend to AI / Agent engineering

- API design → tool schema design.
- Service governance → tool reliability and fallback.
- Cache strategy → context or retrieval cache.
- Circuit breaker → tool timeout and graceful degradation.
- Logs and monitoring → observability.
- Workflow orchestration → agent workflow design.

### Trading systems to complex system engineering

- 订单状态流转 → state machine and lifecycle modeling.
- 高频行情数据 → high-frequency streaming or rendering.
- 盘口 / 仓位 → real-time data consistency.
- 风控 / 异常状态 → edge case handling and fallback.
- E2E 测试 → critical path validation.

### Open source to engineering credibility

- PR contribution → large codebase reading ability.
- Organization membership → trusted community participation.
- Documentation contribution → ecosystem collaboration.
- Tooling contribution → infrastructure and developer experience awareness.

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

It should not make the reader think:

```text
This candidate only listed technologies, watched tutorials, or built toy demos.
```
