---
id: concept.telemetry
title: Telemetry
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - telemetry
  - observability
  - tracing
depends_on:
  - concept.artifact
  - concept.evaluation
related:
  - concept.workflow
  - concept.governance
---

## Specification

### Definition

Telemetry is the observable output of a Synthetic Team captured as traces, artifacts, evaluation outcomes, and tool executions. It forms the permanent record of what happened, what was produced, how it was evaluated, and how it was done.

### Baseline Model

```
Traces + Artifacts + Evaluation Outcomes + Tools
```

These four things become the organizational memory — not chat history.

### Trace Structure

Every span contains:

```json
{
  "trace_id": "",
  "task_id": "",
  "role": "",
  "parent_span": "",
  "model": "",
  "tool_calls": [],
  "inputs": [],
  "outputs": [],
  "artifacts": [],
  "evaluation": {},
  "timestamp": ""
}
```

### Minimum OpenTelemetry Spans

```
TaskSpan
  IntakeSpan
  ConsultationSpan
  AssemblySpan
  AnalysisSpan
  BuildSpan
  ReviewSpan
  TruthSpan
  DeploySpan
```

### Span Attributes

```
role, model, tool, artifact, evaluation_score, cost, duration, success
```

### Role Trace Requirements

| Role | Traces | Artifacts |
|---|---|---|
| Truth-Teller | Claims examined, sources consulted, contradictions found, confidence score | truth-report.md, risk-log.md, assumption-register.md |
| Analyst | Requirements derived, assumptions, questions raised | prd.md, spec.md, adr.md, task-graph.json |
| Builder | Files touched, commands run, time spent, dependencies | commits, tests, docs, migration scripts |
| Reviewer | Findings, severity, recommendations | review-report.md, security-review.md |
| Operator | Deploys, rollbacks, commands, environment changes | runbooks, deploy logs, incident reports |
| Facilitator | Everything (full state) | task-manifest.md, ledger.json, state-summary.md, decision-log.md |
| Capability Planner | Domain classification, role selection, workflow template | team-topology.md, capability-rationale.md |

---

## Rationale

Telemetry exists because an unobservable Synthetic Team is indistinguishable from a conversation. Without traces, artifacts, and evaluations, the team cannot learn, cannot audit, and cannot improve. The minimum telemetry model treats every role execution as a traced span with associated artifacts and evaluations, making the team itself an observable system rather than a collection of conversations.
