---
id: concept.synthetic-teams
title: Synthetic Teams
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - synthetic-teams
  - framework
  - collaboration
  - human-ai
depends_on:
  - concept.role-card
  - concept.workflow
  - concept.authority
  - concept.governance
produces:
  - concept.trust
related:
  - concept.activation-condition
  - concept.evaluation
---

## Specification

### Definition

A Synthetic Team is a role-constrained system that governs how humans and AI produce work under explicit authority, sequencing, and accountability. The system exists to constrain contribution, assign responsibility, and make outputs traceable.

### Core Principles

1. **AI as Collaborator**: AI is assigned bounded responsibilities limited to defined production functions.
2. **Output Accountability**: All outputs must meet explicit accountability conditions or be removed.
3. **Workflow Constraints**: Work progresses through ordered stages with one authority holder per stage, and decisions are blocked until defined validation steps are satisfied.

### Interaction Modes

1. **Person ↔ Person** — direct collaboration
2. **Person ↔ AI** — guided interaction
3. **AI ↔ Process** — automated execution against predefined rules

### Topologies

| Topology | Roles |
|---|---|
| Stream-Aligned | Operator + Truth-Teller |
| Platform | Builder + Operator |
| Complicated Subsystem | Builder + Specialist + Reviewer |
| Enabling | Product Owner + Reviewer |

### Implementation Model

1. Define whether AI augments or replaces a specific role
2. Select interaction mode and assign role archetypes
3. Establish a staged workflow with explicit authority per stage
4. Define validation steps required before decisions

### Execution Model

- Diagnose gaps in execution
- Balance functional roles
- Prevent over-reliance on creation without validation

---

## Rationale

### Origin

AI introduces speed and scale without inherent responsibility. Explicit constraints are required to maintain coherence and control.

### Cognitive Load Management

- Intrinsic load handled through task decomposition
- Extraneous load reduced via constrained roles
- Germane load reserved for human judgment and decision-making

### Core Insight

Unstructured collaboration fails due to role ambiguity and uncontrolled interaction. Synthetic Teams enforces defined responsibility, constrained action, and ordered interaction. Failures become localized, decisions become traceable, and output remains controllable. Without enforcement, it degrades into unstructured work with untraceable outcomes.
