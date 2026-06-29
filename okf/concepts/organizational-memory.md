---
id: concept.organizational-memory
title: Organizational Memory
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - organizational-memory
  - ownership
  - artifact
  - durability
depends_on:
  - concept.artifact
  - concept.role-card
  - concept.workflow
related:
  - concept.synthetic-teams
  - concept.evaluation
  - concept.telemetry
  - concept.governance
---

## Specification

### Definition

Organizational memory is the durable record of every artifact produced by a synthetic team, with explicit ownership assigned to exactly one role. Every decision, specification, evaluation, and trace is owned by a single role, versioned, and discoverable. The organization remembers through its artifacts, not through conversation history.

### Artifact Ownership

Every artifact has exactly one owning role:

| Artifact | Owner | Rationale |
|---|---|---|
| Task Manifest | Facilitator | Intake classification and normalization |
| Requirements | Analyst | Intent translated to executable specification |
| Architecture Decision Records | Analyst | Design decisions with rationale |
| Task Graph | Facilitator | Work decomposition and sequencing |
| Code | Builder | Implementation artifacts |
| Tests | Builder | Verification artifacts |
| Review Report | Reviewer | Quality assessment findings |
| Truth Report | Truth-Teller | Evidence verification and claims |
| Runbook | Operator | Deployment and operational procedures |
| Deployment Record | Operator | Production release history |
| Traces | Observability Platform | Runtime telemetry |
| Evaluation Results | Evaluation Platform | Quality metrics over time |
| Decision Log | Facilitator | Governance and conflict resolution |

### Ownership Properties

1. **Explicit**: Every artifact has exactly one owning role in its metadata
2. **Versioned**: Every artifact carries a version that increments with each change
3. **Discoverable**: Artifacts are indexed by type, owner, workflow, and timestamp
4. **Immutable**: Published artifacts are append-only; corrections produce new versions
5. **Traceable**: Every artifact links to its producing workflow instance and input artifacts

### Ownership vs. Production

Ownership is distinct from production:
- The **producer** creates the artifact (e.g., Builder writes code)
- The **owner** is accountable for its correctness and evolution (e.g., Builder owns code until handoff)
- Ownership may transfer (e.g., code ownership transfers from Builder to Operator after deployment)

### Organizational Learning

Organizational memory enables learning across workflow instances:

1. **Pattern recognition**: Recurring defect types, bottleneck stages, handoff failures
2. **Knowledge retention**: Design rationale survives role rotation
3. **Comparative evaluation**: Current outputs can be compared against historical baselines
4. **Capability growth**: The Capability Planner uses historical outcomes to improve topology selection

### Relationship to Telemetry

Organizational memory extends the telemetry baseline:

```
Traces + Artifacts + Evaluation Outcomes + Tools + Ownership Records
```

The ownership record answers: who was accountable for every artifact at every point in time.

---

## Rationale

Organizational memory exists because without explicit ownership, artifacts become orphaned. An orphaned artifact cannot be improved, questioned, or retired. By assigning every artifact to exactly one owning role, the framework ensures that every piece of organizational knowledge has a responsible custodian.

This extends the Artifact-First Principle: not only are artifacts permanent, but their ownership is permanent and discoverable. The organization can learn from its history because it remembers who produced what, when, and under what authority.