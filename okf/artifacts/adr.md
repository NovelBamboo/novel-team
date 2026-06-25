---
id: artifact.adr
title: Architecture Decision Record
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - adr
  - decision
  - architecture
depends_on:
  - concept.artifact
  - role.analyst
consumes:
  - artifact.spec
related:
  - artifact.decision-record
  - role.builder
producer: role.analyst
consumer: role.builder, role.reviewer
lifecycle: Proposed → Accepted → Deprecated → Superseded
schema: schema.decision
validation_rules:
  - Must state the decision clearly
  - Must include alternatives considered
  - Must include rationale for rejection
  - Must be dated and versioned
---

## Specification

### Purpose

An Architecture Decision Record (ADR) captures a significant architectural decision, the alternatives considered, and the rationale for the chosen approach.

### Contents

- Title and status
- Context and problem statement
- Decision
- Alternatives considered
- Consequences (positive and negative)
- Compliance notes

### Validation

- Decision must be explicitly stated
- At least one alternative must be documented
- Rationale must reference specific criteria
- Status must reflect actual lifecycle state

### Lifecycle

1. **Proposed** — Decision suggested, not yet accepted
2. **Accepted** — Decision approved, implementation follows
3. **Deprecated** — Decision no longer recommended
4. **Superseded** — New ADR replaces this one

### Related Workflows

- workflow.default (produced by Analyst)
