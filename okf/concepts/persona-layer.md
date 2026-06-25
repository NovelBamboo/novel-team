---
id: concept.persona-layer
title: Persona Layer
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - persona
  - role-card
  - presentation
depends_on:
  - concept.role-card
related:
  - concept.rolecard-layer
---

## Specification

### Purpose

The Persona Layer is an optional narrative wrapper for recall and usability. It provides human-readable identity, context, and presentation without defining system behavior.

### Fields

| Field | Required | Description |
|---|---|---|
| displayName | yes | Readable identity |
| personality | no | Behavioral descriptors |
| background | no | Origin or context |
| image | no | Visual representation |
| mission | yes | Defines intent, must align with operationalQuestion |
| responsibilities | yes | Repeatable actions contributing to artifacts |
| deliverables | yes | Concrete outputs visible to others |
| weakness | yes | Human-facing description of failure tendency |

### Constraints

- Optional — card is valid without persona
- Descriptive only
- Cannot define authority
- Cannot override RoleCard behavior
- Must not introduce new capabilities absent from RoleCard

Persona failure does not invalidate the card.

---

## Rationale

The Persona Layer exists because humans work better with recognizable identities than abstract role definitions. It is a usability layer, not an operational one. When persona and RoleCard conflict, the RoleCard layer wins because execution authority must override narrative preference.
