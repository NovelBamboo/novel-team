---
id: concept.role-card
title: Role Card
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - role-card
  - role
  - framework
depends_on:
  - concept.authority
  - concept.activation-condition
produces:
  - concept.persona-layer
  - concept.rolecard-layer
related:
  - concept.synthetic-teams
  - concept.artifact
---

## Specification

### Definition

A Role Card is a constrained role definition that converts responsibility into a unit with defined inputs, actions, and outputs. Each card includes a Persona Layer (narrative wrapper) and a RoleCard Layer (executable responsibility unit).

### Fields

| Field | Layer | Description |
|---|---|---|
| name | Persona | Display identity |
| personality | Persona | Behavioral traits |
| archetype | Persona | Functional family (Analyst, Builder, Operator, Truth-Teller, Reviewer, Facilitator) |
| mission | Persona | Defines intent, not action |
| responsibilities | Persona | Repeatable actions mapping to outputs |
| deliverables | Persona | Concrete inspectable artifacts |
| weakness | Persona | Human-facing failure tendency |
| name | RoleCard | Operational identifier |
| alias | RoleCard | Secondary label |
| archetypeFamily | RoleCard | Functional classification |
| level | RoleCard | Beginner, Pro, or Legendary |
| primaryType | RoleCard | Core function |
| secondaryType | RoleCard | Secondary function |
| operationalQuestion | RoleCard | Decision lens the role exists to answer |
| activationCondition | RoleCard | When the role becomes active |
| authority | RoleCard | Bounded decision control |
| signatureMove | RoleCard | Highest-value repeatable action |
| artifactProduced | RoleCard | Observable outputs |
| specialAbility | RoleCard | Non-standard capability (cannot violate role boundaries) |
| weakness | RoleCard | Intentional limitation creating dependency |
| synergyBoost | RoleCard | Which role is strengthened and how |
| xpGainCondition | RoleCard | Learning loop condition |

### Structural Constraints

- **Justifiability**: A role must perform a necessary function
- **Observability**: A role must produce visible outputs
- **Auditability**: Actions must be attributable to a role

Roles that fail these constraints are removed.

### Role Boundaries

- Analyst does not produce final output
- Builder does not validate its own work
- Reviewer does not create new artifacts
- Operator does not redefine direction
- Truth-Teller does not bypass evidence
- Facilitator does not replace execution

### Weakness as Control

Weakness is an enforced limitation that prevents role dominance, forces dependency between roles, and signals when another role must be activated. Unbalanced roles produce predictable errors.

---

## Rationale

Collaboration becomes more controllable and inspectable when responsibilities are explicit, bounded, and activated in sequence. When roles are unclear, unbounded, or simultaneously authoritative, ownership becomes harder to identify and work becomes harder to audit.
