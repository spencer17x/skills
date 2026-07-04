# Resume Optimization Guide

Detailed reference for the `resume` skill.

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

- 熟悉
- 了解
- 掌握
- 参与
- 协助
- 负责开发
- 搭建
- 接入
- 使用
- 维护

These words are not always wrong, but they are weak when used alone.

### Prefer ownership verbs

Use stronger verbs when accurate:

- 负责
- 独立负责
- 主导
- 设计
- 实现
- 落地
- 上线
- 重构
- 优化
- 封装
- 沉淀
- 推动
- 交付
- 排查
- 解决
- 降低
- 提升
- 保障

English equivalents:

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

## Resume Bullet Formula

Use this formula:

```text
Business context + ownership + technical solution + challenge + result
```

Chinese version:

```text
负责 / 主导 X，在 Y 场景下，通过 Z 方案解决 A 问题，最终提升 / 降低 / 支撑 / 保障 B。
```

English version:

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
7. Was it shipped, launched, used internally, validated as a PoC, or only a demo?
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

- 支持真实客户落地
- 完成内部 PoC 验证
- 支撑核心业务流程
- 提升后续迭代效率
- 降低维护成本
- 改善问题排查效率
- 支持多项目复用

Never fabricate metrics.

## Rewrite Examples

### Weak technology listing

Bad:

```text
熟悉 React、Vue、TypeScript，参与后台系统开发。
```

Good:

```text
负责后台系统核心页面开发，基于 Vue3 和 TypeScript 实现配置管理、数据查询和权限控制等模块，并抽象通用表单、表格和弹窗组件，提升后续业务页面交付效率。
```

### Weak project ownership

Bad:

```text
参与订单系统开发，负责部分接口联调。
```

Good:

```text
负责订单列表与订单详情模块开发，围绕订单状态流转、异常状态展示和用户操作反馈设计前端交互逻辑，并与后端完成接口协议对齐，保障核心订单链路稳定交付。
```

### Weak performance description

Bad:

```text
优化页面性能，提升用户体验。
```

Good:

```text
针对高频数据刷新导致的页面卡顿问题，重构状态更新链路并拆分高频渲染组件，减少无效重渲染，使核心页面交互性能提升 40%+。
```

### Weak AI project description

Bad:

```text
熟悉 RAG，搭建了知识库问答系统。
```

Good:

```text
设计并实现知识库问答链路，对文档进行切分、向量化、检索和答案合成，并增加引用来源、结果校验和异常兜底策略，提升问答可信度并降低模型幻觉风险。
```

### Weak backend description

Bad:

```text
负责接口开发和系统维护。
```

Good:

```text
负责核心业务接口设计与性能优化，针对高并发查询场景引入缓存和分页策略，降低数据库压力，并通过日志监控和异常告警提升线上问题定位效率。
```

## Role Translation Rules

Translate existing experience into the language of the target role.

### Frontend to product engineering

- 页面开发 → user workflow implementation.
- 组件封装 → reusable UI system.
- 状态管理 → complex interaction state modeling.
- 性能优化 → user experience and responsiveness improvement.
- E2E 测试 → product quality assurance.

### Backend to AI / Agent engineering

- API design → tool schema design.
- Service governance → tool reliability and fallback.
- Cache strategy → context or retrieval cache.
- Circuit breaker → tool timeout and graceful degradation.
- Logs and monitoring → observability.
- Workflow orchestration → agent workflow design.

### Trading system to complex system engineering

- 订单状态流转 → state machine and lifecycle modeling.
- 高频行情数据 → high-frequency data rendering or streaming.
- 盘口 / 仓位 → real-time data consistency.
- 风控 / 异常状态 → edge case handling and fallback.
- E2E 测试 → critical path validation.

### Open source to engineering credibility

- PR contribution → ability to read large codebases.
- Organization membership → trusted community participation.
- Documentation contribution → ecosystem collaboration.
- Tooling contribution → infrastructure and developer experience awareness.

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
热爱技术，学习能力强，抗压能力强。
```

Prefer concrete positioning:

```text
具备前端 / 全栈工程经验，长期负责交易系统、工程化平台和 AI 应用项目落地，擅长将复杂业务流程拆解为可维护的系统架构，并通过性能优化、自动化测试和工程化建设提升交付质量。
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

Open-source contributions should not be written only as links. Explain what they prove:

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

- “你说熟悉，具体用过什么？”
- “你参与了哪部分？”
- “这个项目上线了吗？”
- “这个指标怎么来的？”
- “这是你做的还是团队做的？”

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
