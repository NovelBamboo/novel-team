---
id: concept.team-api
title: Team API
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - team-api
  - interface
  - contract
  - replaceability
depends_on:
  - concept.artifact
  - concept.role-card
related:
  - concept.synthetic-teams
  - concept.team-topology
  - concept.evaluation
  - concept.cognitive-load
---

## Specification

### Definition

A Team API is the predictable interface every role exposes. It defines the exact inputs a role requires and the exact outputs it produces, formalizing the handoff contract between roles. When every role has a well-defined API, roles become independently replaceable, testable, and automatable.

### Structure

Every role API consists of:

| Element | Description |
|---|---|
| Identity | Canonical role ID |
| Inputs | Required artifacts and their schemas |
| Outputs | Produced artifacts and their schemas |
| Preconditions | What must be true before activation |
| Postconditions | What is guaranteed after completion |
| Error states | Known failure modes and their signals |
| Evaluation criteria | How the role's output is assessed |

### Role APIs

**Analyst API:**
```
Inputs:   Task Manifest, Domain references, Constraints
Outputs:  Spec, ADR, Task Graph, Acceptance Tests
Precondition: Task Manifest classified and approved
Postcondition: Requirements are testable and unambiguous
```

**Builder API:**
```
Inputs:   Spec, ADR, Task Graph, Acceptance Tests
Outputs:  Implementation, Tests, Documentation, Known Issues
Precondition: Spec frozen and approved
Postcondition: Implementation passes acceptance tests
```

**Reviewer API:**
```
Inputs:   Implementation, Tests, Spec
Outputs:  Review Report (findings, severity, recommendations)
Precondition: Implementation artifacts exist
Postcondition: Every finding has severity and recommendation
```

**Truth-Teller API:**
```
Inputs:   Claims (from Spec, Implementation, Review Report), Evidence sources
Outputs:  Truth Report (verified claims, confidence scores, contradictions)
Precondition: Review complete
Postcondition: Every claim has confidence level
```

**Operator API:**
```
Inputs:   Validated artifacts, Release packet, Rollback plan
Outputs:  Runbook, Deploy logs, Telemetry snapshots
Precondition: Truth report passed, human approval granted
Postcondition: System is running or safely rolled back
```

**Capability Planner API:**
```
Inputs:   Task Manifest
Outputs:  Team topology, Workflow selection, Required artifact list
Precondition: Task Manifest classified
Postcondition: Selected topology is the smallest sufficient team
```

### Contract Properties

1. **Input validation**: Every input must conform to its schema before activation
2. **Output guarantee**: Every output must satisfy its postcondition
3. **Error propagation**: Known errors produce structured error artifacts
4. **Idempotency where possible**: Repeated activation with same inputs produces same outputs
5. **No side effects**: Role produces only its declared outputs

### Replaceability

Because every role exposes a stable API:
- Any role implementation can be swapped without changing the workflow
- Roles can be tested in isolation using mock inputs
- New roles can be introduced by implementing the same API
- Human and AI roles are interchangeable at the API boundary

### Relationship to Artifacts

The Team API formalizes what the Artifact-First principle already implies: artifacts are the contracts between roles. The API defines exactly which artifacts are required and what they must contain.

---

## Rationale

Team APIs exist because implicit handoffs are the leading cause of pipeline failure. When a Builder must guess what the Analyst intended, or a Truth-Teller must reconstruct what the Reviewer evaluated, the system degrades into conversation-dependent coordination. Explicit APIs ensure that every handoff is defined, verifiable, and testable — making the pipeline resilient to role changes, context resets, and team reconfiguration.