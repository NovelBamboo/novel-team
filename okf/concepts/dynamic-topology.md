---
id: concept.dynamic-topology
title: Dynamic Topology
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - dynamic-topology
  - reconfiguration
  - runtime
  - incident
depends_on:
  - concept.team-topology
  - concept.workflow
  - concept.cognitive-load
  - role.capability-planner
related:
  - concept.synthetic-teams
  - concept.team-api
  - concept.activation-condition
  - artifact.task-manifest
---

## Specification

### Definition

Dynamic topology is the ability of a synthetic team to reconfigure its active role composition at runtime based on workload type, incident severity, or cognitive load thresholds. Unlike human teams that reconfigure slowly, synthetic teams can switch topologies between workflow instances or even within a single workflow.

### Topology Switching

The active topology depends on workload:

**Normal feature development:**
```
Analyst → Builder → Reviewer → Truth-Teller → Operator
```

**Security incident:**
```
Analyst → Builder → Security Reviewer → Truth-Teller → Operator → Incident Commander
```

**Performance investigation:**
```
Analyst → Builder → Performance Expert → Reviewer
```

**Research task:**
```
Research Analyst → Truth-Teller → Architect
```

**Compliance audit:**
```
Analyst → Compliance Reviewer → Truth-Teller → Legal SME
```

### Switching Triggers

Topology switches are triggered by:

| Trigger | Mechanism | Typical Switch |
|---|---|---|
| Task classification | Task Manifest type field | Feature → security incident topology |
| Cognitive load threshold | Load metrics exceed budget | Split role, add intermediate stage |
| Evaluation failure | Repeat review/truth failures | Add enabling advisor |
| Human intervention | Sponsor reclassifies work | Switch to appropriate topology |
| Incident detection | Runtime monitoring alert | Add incident commander, expand operator |
| Learning trigger | Pattern of repeated failures | Change topology permanently |

### Reconfiguration Protocol

When a topology switch is needed:

1. **Detect**: Facilitator or Capability Planner identifies trigger
2. **Assess**: Capability Planner evaluates required topology change
3. **Propose**: New topology is proposed with rationale
4. **Approve**: Facilitator approves (or human sponsor for high-risk switches)
5. **Switch**: Current workflow state is preserved, new roles are activated
6. **Resume**: Work continues with new topology

### State Preservation

During topology switches:
- All completed artifacts remain in the artifact store
- In-progress work is completed by current role before switch
- Handoff boundaries are respected — switch occurs at stage boundaries
- The decision record documents the switch rationale

### Relationship to Capability Planner

The Capability Planner selects the initial topology at workflow start. Dynamic topology extends this by allowing re-selection mid-workflow when triggers fire. The Capability Planner maintains a topology registry mapping workload types to role compositions:

```
Topology Registry:
  feature: [Analyst, Builder, Reviewer, Truth-Teller, Operator]
  security-incident: [Analyst, Builder, Security-Reviewer, Truth-Teller, Operator, Incident-Commander]
  performance: [Analyst, Builder, Performance-Expert, Reviewer]
  research: [Research-Analyst, Truth-Teller, Architect]
  compliance: [Analyst, Compliance-Reviewer, Truth-Teller, Legal-SME]
```

---

## Rationale

Dynamic topology exists because the optimal team for one type of work is suboptimal for another. A security incident requires different expertise, different authority, and different interaction modes than a routine feature delivery. Human organizations handle this through on-call rotations, incident command systems, and specialized response teams — but these reconfigurations take time and introduce handoff risk.

Synthetic teams can switch topologies at the speed of classification. By making topology a runtime property rather than a design-time constraint, the framework ensures that every task is handled by the smallest sufficient team with the most relevant expertise — without requiring permanent role allocations for rare event types.