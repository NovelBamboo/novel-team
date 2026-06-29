---
id: concept.cognitive-load
title: Cognitive Load
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - cognitive-load
  - context-window
  - boundaries
  - scaling
depends_on:
  - concept.role-card
  - concept.workflow
produces:
  - concept.team-topology
related:
  - concept.synthetic-teams
  - concept.team-api
  - concept.evaluation
  - concept.dynamic-topology
---

## Specification

### Definition

Cognitive load is the primary design constraint for a synthetic team. For human teams, cognitive load determines how much a team can own before coherence breaks. For synthetic teams, cognitive load is measured as context window load — the total information a role must hold simultaneously to perform its transformation.

The design principle: every role should fit comfortably inside one context window.

### Mapping

| Human Team Topologies | Synthetic Team |
|---|---|
| Team cognitive load | Context window load |
| Team responsibilities | Prompt responsibility |
| Knowledge boundary | Context boundary |
| Team ownership | Artifact ownership |

### Measurement

Each role's cognitive load is measured across these dimensions:

| Dimension | Description |
|---|---|
| Context tokens | Total tokens required for role instructions + current input |
| Dependencies | Number of artifacts and roles this role depends on |
| Artifact count | Number of artifacts the role must produce or reference |
| Tool complexity | Number and complexity of tools the role operates |
| Decision surface | Number of decisions the role must make per cycle |

### Role-Specific Load Metrics

**Builder:**
- Files touched, dependencies imported, functions modified
- Context tokens consumed per task
- Tool invocations per cycle
- Review findings per output (inverse quality signal)

**Reviewer:**
- Files reviewed, comments generated, defects found
- Complexity of artifacts under review
- Coverage breadth required

**Analyst:**
- Requirements derived, decision records produced
- Acceptance tests written, unknowns resolved
- Domain complexity

**Truth-Teller:**
- Claims examined, sources consulted
- Contradictions found, confidence scores
- Evidence depth required

### Cognitive Budget Model

Every role has a cognitive budget — a ceiling on load dimensions. When any dimension exceeds its threshold, the role should be split.

**Split heuristics:**
- Context tokens exceed context window → split domain knowledge from task execution
- Artifact count exceeds 7 ± 2 → split into producer and reviewer roles
- Decision surface exceeds 3 independent decisions per cycle → split into sequential stages
- Dependency count exceeds 5 → introduce intermediate roles or collation artifacts

### Example: Splitting Analyst

When the Analyst role exceeds its cognitive budget:

```
Analyst
  ├── Business Analyst (requirements gathering)
  ├── Technical Analyst (specification authoring)
  └── Domain Analyst (domain knowledge maintenance)
```

Each sub-role fits within one context window and hands off via artifacts.

### Thresholds and Escalation

When load approaches threshold, the Facilitator may:
1. Split the role into sub-roles
2. Introduce intermediate handoff artifacts
3. Extend the workflow with additional stages
4. Request human intervention for overloaded decisions

---

## Rationale

Cognitive load exists as a concept because unbounded context leads to model thrashing. A single agent tasked with requirements, architecture, implementation, review, deployment, verification, documentation, and evaluation will eventually exceed its context window and begin to degrade.

By treating cognitive load as a first-class design constraint, the framework ensures that every role transformation remains reliable. The cognitive budget model provides explicit thresholds for when and how to split roles, keeping each role's scope manageable and its outputs trustworthy.