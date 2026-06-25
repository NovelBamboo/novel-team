---
id: concept.rolecard-layer
title: RoleCard Layer
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - rolecard
  - execution
  - role-card
depends_on:
  - concept.role-card
  - concept.authority
  - concept.activation-condition
related:
  - concept.persona-layer
---

## Specification

### Purpose

The RoleCard Layer is the authoritative execution model. It defines responsibility, authority, activation, and evaluation.

### Fields

| Field | Required | Description |
|---|---|---|
| name | yes | Operational identifier |
| alias | yes | Secondary label |
| archetypeFamily | yes | Functional classification (Analyst, Builder, Operator, Truth-Teller, Reviewer, Facilitator) |
| level | yes | Beginner, Pro, or Legendary |
| primaryType | yes | Core function |
| secondaryType | no | Secondary function |
| operationalQuestion | yes | Primary question the role exists to answer |
| activationCondition | yes | When the role becomes active |
| authority | yes | Bounded decision control |
| signatureMove | yes | Highest-value repeatable action |
| artifactProduced | yes | Observable outputs (mandatory — no artifact means no role) |
| specialAbility | no | Non-standard capability (cannot violate role boundaries) |
| weakness | yes | Intentional limitation creating dependency on other roles |
| synergyBoost | no | Which role is strengthened and how |
| xpGainCondition | no | Learning loop condition |

### Constraints

- Mandatory — card is invalid without it
- Fully operational
- Observable — must map to observable behavior
- Authoritative — overrides persona if conflict occurs

RoleCard failure invalidates the card.

---

## Rationale

The RoleCard Layer exists because execution requires precision. Narrative ambiguity in the Persona Layer is acceptable; ambiguity in the RoleCard Layer produces untraceable decisions and unaccountable outputs. If the RoleCard Layer cannot assign authority, define activation, produce artifacts, expose weaknesses, or be evaluated, the card fails regardless of persona quality.
