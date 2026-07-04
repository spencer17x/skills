# AI Agent Resume Example

Use this reference when rewriting AI Agent, AI application, RAG, or LLM workflow project experience.

## Scenario

The user provides rough notes such as:

```text
我做过一个智能客服 Agent，用 LangChain / LangGraph 和 RAG，接了公司知识库，可以回答用户问题。也做了工具调用，可以查订单。用了 Redis 存对话历史，做了 Prompt 优化。
```

The goal is to turn vague notes into resume-ready bullets with ownership, technical depth, reliability thinking, and results.

## Weak Version

```text
熟悉 LangChain / LangGraph，掌握 RAG 技术，参与智能客服 Agent 项目开发。
负责 Prompt 调优，接入知识库问答和工具调用能力。
了解向量数据库、Embedding 和 Redis 会话存储。
```

### Problems

- Too many weak verbs: 熟悉、掌握、参与、了解.
- No clear ownership.
- No business scenario.
- No Agent workflow design.
- No retrieval or tool-calling details.
- No failure handling.
- No result or validation.
- Sounds like a demo or tutorial project.

## Better Version

```text
负责智能客服 Agent 核心链路设计与开发，面向用户售前咨询、产品 FAQ 和订单状态查询等场景，构建基于 RAG + Tool Calling 的多轮问答系统。
基于 LangGraph 设计 Agent Workflow，将用户问题处理流程拆分为意图识别、知识库检索、工具路由、结果校验和回答合成等阶段，提升 Agent 行为的可控性与可维护性。
负责知识库 RAG 链路建设，对产品文档、FAQ 和运营规则进行清洗、切分、Embedding 和向量检索，并在回答中返回引用来源，降低模型幻觉风险。
设计订单查询工具的 Tool Schema 与调用链路，支持 Agent 根据用户意图调用订单状态查询接口，并针对接口超时、参数缺失和权限不足等场景增加重试、降级和兜底回复。
基于 Redis 实现多轮对话状态管理和会话持久化，对长对话进行摘要压缩，降低上下文 token 消耗并保持核心上下文连续性。
沉淀客服 Agent Prompt 模板、工具调用失败处理策略和问题分类规则，支持内部测试和业务场景验证。
```

## Strong Version with Real Metrics

Only use this level of specificity when the user has provided real metrics.

```text
负责智能客服 Agent 核心链路设计与上线，面向售前咨询、产品 FAQ 和订单状态查询等场景，构建基于 RAG + Tool Calling 的多轮问答系统，支撑日均 3000+ 用户会话。
基于 LangGraph 设计 Agent Workflow，将用户问题处理流程拆分为意图识别、知识库检索、工具路由、结果校验和回答合成等阶段，使复杂客服问题从单轮问答升级为可控的多步骤处理流程。
负责知识库 RAG 链路建设，对 500+ 篇产品文档进行清洗、切分、Embedding 和向量检索，并增加引用来源、结果校验和兜底回复，将高频问题回答准确率从 67% 提升至 91%。
设计订单查询工具的 Tool Schema 与调用链路，支持 Agent 根据用户意图调用订单状态查询接口，并针对接口超时、参数缺失和权限不足等场景增加重试、降级和兜底回复，工具调用失败后的有效兜底率提升至 95%+。
基于 Redis 实现多轮对话状态管理和会话持久化，对超过 20 轮的长对话触发摘要压缩，将单次推理上下文 token 消耗从 8000+ 降低至 2000 以内。
上线后人工转接率从 45% 降低至 12%，客服平均响应时延从 4.2 秒优化至 1.1 秒，显著降低人工客服压力和用户等待时间。
```

## If Metrics Are Missing

Do not fabricate numbers. Use truthful qualitative results or placeholders.

```text
负责智能客服 Agent 核心链路设计与开发，面向售前咨询、产品 FAQ 和订单状态查询等场景，构建基于 RAG + Tool Calling 的多轮问答系统，完成内部 PoC 验证。
基于 LangGraph 设计 Agent Workflow，将用户问题处理流程拆分为意图识别、知识库检索、工具路由、结果校验和回答合成等阶段，提升 Agent 行为的可控性与可维护性。
负责知识库 RAG 链路建设，对产品文档、FAQ 和运营规则进行清洗、切分、Embedding 和向量检索，并在回答中返回引用来源，降低模型幻觉风险。
设计订单查询工具的 Tool Schema 与调用链路，支持 Agent 根据用户意图调用订单状态查询接口，并针对接口超时、参数缺失和权限不足等场景增加重试、降级和兜底回复。
基于 Redis 实现多轮对话状态管理和会话持久化，对长对话进行摘要压缩，降低上下文 token 消耗并保持核心上下文连续性。
沉淀客服 Agent Prompt 模板、工具调用失败处理策略和问题分类规则，支持后续接入真实客服场景。
```

## Experience Mining Questions

When the user only provides vague notes, ask for the most valuable missing details:

```text
1. 这个 Agent 项目是 Demo、内部 PoC，还是已经线上使用？
2. 你具体负责哪部分：RAG、Agent Workflow、Tool Calling、后端接口、前端页面、部署运维，还是整体都负责？
3. 知识库规模大概是多少：文档数量、FAQ 数量、chunk 数量，或者数据来源有哪些？
4. 有没有效果指标：准确率、转人工率、响应时延、日均会话、成本、token 消耗、测试覆盖率？
5. Agent 失败时你做了哪些处理：重试、fallback、人工转接、规则兜底、权限校验、日志告警？
```

## Rewrite Pattern

Use this structure:

```text
业务场景 + ownership + Agent 架构 / Workflow + 核心技术实现 + 失败处理 / 可靠性 + 结果
```

Example formula:

```text
负责 X 场景下的 Agent 系统设计与开发，基于 Y 技术构建 Z Workflow，解决 A 问题，并通过 B 策略提升 C 结果。
```

## AI Agent Project Checklist

Mention these only when true.

### Business Scenario

- 客服 Agent
- 销售 Agent
- 数据分析 Agent
- 测试 Agent
- 编程 Agent
- 运维 Agent
- 运营 Agent
- 研究 Agent
- 企业知识库问答
- 垂直行业助手

### Ownership

- 独立设计 Agent 核心链路
- 负责 RAG 检索链路
- 负责 Tool Calling / MCP 工具封装
- 负责 Agent Workflow 编排
- 负责多轮对话状态管理
- 负责前后端接入
- 负责部署、监控和稳定性
- 负责评测和优化

### Agent Architecture

- Intent Router
- Planner
- Tool Router
- RAG Retriever
- Answer Generator
- Memory Manager
- State Machine
- Human Handoff
- Safety Guardrail
- Evaluator
- Fallback Handler

### RAG Details

- Document cleaning
- Markdown / PDF parsing
- Chunking strategy
- Embedding
- Vector search
- Hybrid search
- Reranking
- Citation
- Context compression
- Query rewriting
- Recall evaluation

### Tool Calling Details

- Tool Schema design
- Function calling
- MCP Server
- API integration
- Permission check
- Parameter validation
- Timeout handling
- Retry
- Fallback
- Tool result summarization

### Reliability

- JSON Schema validation
- Structured output
- Retry and repair
- Rate limiting
- Logging
- Monitoring
- Safety boundary
- Manual handoff
- Error classification
- Cost control
- Latency optimization

### Metrics

- Accuracy
- Recall
- Hallucination rate
- Human handoff rate
- Average latency
- P95 / P99 latency
- Token cost
- Daily conversations
- Tool success rate
- Test pass rate
- Manual workload reduction

## Bad to Good Transformations

### RAG

Bad:

```text
熟悉 RAG，做过知识库问答。
```

Good:

```text
负责企业知识库 RAG 问答链路建设，对产品文档进行清洗、切分、Embedding 和向量检索，并增加引用来源、结果校验和兜底回复，降低模型幻觉风险。
```

Strong:

```text
负责企业知识库 RAG 问答链路建设，对 500+ 篇产品文档进行清洗、切分、Embedding 和向量检索，并增加引用来源、结果校验和兜底回复，使高频问题回答准确率从 72% 提升至 90%+。
```

### Tool Calling

Bad:

```text
接入了工具调用，可以查订单。
```

Good:

```text
设计订单查询工具的 Tool Schema 与调用链路，支持 Agent 根据用户意图调用订单状态查询接口，并针对参数缺失、接口超时和权限不足等场景增加重试、降级和兜底回复。
```

### Memory

Bad:

```text
用了 Redis 存对话历史。
```

Good:

```text
基于 Redis 实现多轮对话状态管理和会话持久化，并对长对话进行摘要压缩，降低上下文 token 消耗，保证用户咨询过程中的上下文连续性。
```

### Agent Workflow

Bad:

```text
搭建了一个 Agent 流程。
```

Good:

```text
基于 LangGraph 设计多阶段 Agent Workflow，将用户问题处理流程拆分为意图识别、知识库检索、工具路由、结果校验和回答合成等阶段，提升复杂问题处理的可控性和可维护性。
```

### Production

Bad:

```text
项目已完成。
```

Good:

```text
完成内部 PoC 验证，并接入客服测试环境，支持产品 FAQ、订单状态查询和人工转接等核心场景。
```

Strong:

```text
项目上线后支撑日均 3000+ 用户会话，人工转接率从 45% 降低至 12%，客服平均响应时延从 4.2 秒优化至 1.1 秒。
```

## Interview Risk Notes

Before using a strong bullet, make sure the candidate can explain:

```text
1. RAG 的 chunk 策略是怎么设计的？
2. Embedding 模型和向量库为什么这样选？
3. Agent Workflow 的状态结构是什么？
4. 工具调用失败时怎么重试和降级？
5. 多轮对话记忆如何压缩？
6. 如何评估回答准确率？
7. 如何判断是 RAG 召回问题还是模型生成问题？
8. 线上如何做日志、监控、成本控制和人工兜底？
```

If the candidate cannot answer these, simplify the bullet to avoid overclaiming.
