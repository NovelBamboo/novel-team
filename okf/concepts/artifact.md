---
id: concept.artifact
title: Artifact
type: concept
status: stable
version: 1.1
owner: Synthetic Teams
tags:
  - artifact
  - output
  - traceability
depends_on:
  - concept.workflow
produces:
  - artifact.task-manifest
  - artifact.spec
  - artifact.adr
  - artifact.review-report
  - artifact.truth-report
  - artifact.decision-record
  - artifact.task-graph
  - artifact.runbook
related:
  - concept.evaluation
  - concept.telemetry
  - role.capability-planner
---

## Specification

### Definition

An artifact is a structured, versioned, inspectable output produced by a role within a workflow. Artifacts carry work across handoffs and form the permanent record of what was produced, by whom, and under what authority.

### Properties

| Property | Description |
|---|---|
| Producer | The role that creates the artifact |
| Consumer | The role(s) that use the artifact as input |
| Schema | The validation specification the artifact conforms to |
| Lifecycle | Draft → Review → Approved → Superseded |
| Version | Semantic version of the artifact |
| Related Workflows | Which workflows produce or consume this artifact |

### Artifact-First Principle

Conversation discovers ideas; committed artifacts move work between roles. Chat history is transient; artifacts are permanent. The canonical memory of a Synthetic Team is its artifact graph, not its conversation log.

### Artifact Graph

```
Intent (raw input)
    │
    ▼
Task Manifest (Facilitator — classification only)
    │
    ├──▶ Capability Planner → Team Topology
    │
    ▼
Analyst
  ├── Spec
  ├── ADR
  └── Task Graph
        ↓
Builder
  ├── Code
  ├── Tests
  └── Docs
        ↓
Reviewer → review-report.md
        ↓
Truth-Teller → truth-report.md
        ↓
Operator → deploy-log.md
        ↓
Telemetry
```

---

## Rationale

Artifacts exist because they decouple work from the workers. A spec written by an Analyst can be implemented by a Builder who never spoke to the Analyst, reviewed by a Reviewer who never saw the conversation, and verified by a Truth-Teller who only trusts the evidence. This decoupling is what makes Synthetic Teams scalable and auditable.

The Task Manifest extends this decoupling to the entry point of the pipeline. The Facilitator classifies raw intent into a structured manifest without rewriting the specification, preserving the separation between intake (structural analysis) and analysis (domain analysis).
