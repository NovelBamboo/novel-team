---
id: artifact.spec
title: Spec
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - spec
  - specification
  - requirements
depends_on:
  - concept.artifact
  - role.analyst
produces:
  - artifact.task-graph
consumes:
  - concept.intent
related:
  - artifact.adr
  - role.builder
producer: role.analyst
consumer: role.builder
lifecycle: Draft → Review → Approved → Superseded
schema: schema.artifact
validation_rules:
  - Must contain testable acceptance criteria
  - Must define constraints and non-goals
  - Must resolve ambiguous terms
  - Must be versioned
---

## Specification

### Purpose

A spec packet converts intent into executable requirements. It is the primary handoff between Analyst and Builder.

### Contents

- Problem definition
- User stories or functional requirements
- Constraints and non-goals
- Acceptance criteria
- Test cases
- Architecture options with trade-offs
- Unresolved assumptions

### Validation

- Every requirement must be testable
- Every term must be unambiguous
- Acceptance criteria must pass/fail deterministically
- Spec must be versioned and approved before Builder activation

### Lifecycle

1. **Draft** — Analyst produces initial spec
2. **Review** — Facilitator reviews for completeness
3. **Approved** — Spec accepted, Builder activated
4. **Superseded** — New spec replaces this one

### Related Workflows

- workflow.default (produced by Analyst, consumed by Builder)
