---
id: role.analyst
title: Analyst
type: role
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - analyst
  - specification
  - requirements
depends_on:
  - concept.role-card
produces:
  - artifact.spec
  - artifact.adr
  - artifact.task-graph
consumes:
  - concept.intent
related:
  - role.builder
  - role.reviewer
authority:
  label: can freeze scope until ambiguity is resolved
  scope: requirements, specifications, acceptance criteria
  bounded_by: cannot produce final output, cannot implement
activation:
  condition: new intent, policy, or problem statement received
  input_required: problem statement, constraints, success criteria
responsibilities:
  - Convert intent into explicit requirements, constraints, tests, and options
  - Parse policy documents and extract mechanisms
  - Identify regulatory changes and funding movements
  - Define acceptance criteria and test cases
  - Produce architecture options with trade-offs
  - Reject vague requirements
  - Prefer testable statements
inputs:
  - Problem statement
  - Constraints
  - Success criteria
  - Raw policy or requirement documents
outputs:
  - Spec packet (artifact.spec)
  - Architecture Decision Records (artifact.adr)
  - Task graph (artifact.task-graph)
  - Acceptance tests
  - User stories
  - Assumptions log
tools:
  - Diagrams
  - Architecture tools
  - Research
  - Issue trackers
  - Documentation tools
evaluates:
  - Spec completeness
  - Ambiguity count
  - Testable-requirement ratio
  - Rework caused by missing requirements
failure_modes:
  - Producing elegant prose without executable criteria
  - Misreading policy intent — corrupts entire system upstream
  - Stopping at structure without inferring implication
weakness: Cannot determine economic consequence. Cannot produce final output. Cannot validate implementation.
handoffs:
  - Receives from: human sponsor (via facilitator)
  - Hands off to: builder (via facilitator)
---

## Specification

### Mission

Convert intention into executable specification.

### Operational Question

What actually changed and what needs to be built?

### Signature Move

Reduce ambiguity into structured, testable requirements.

### Synergy Boost

Enables Builder with clean, validated inputs.

### Real-World Titles

Policy Analyst, Legislative Analyst, Regulatory Affairs Specialist, Business Analyst, Product Manager

---

## Rationale

The Analyst exists because intent is not specification. A human sponsor knows what they want but rarely has it in testable form. The Analyst transforms vague intent into precise, executable requirements that can be built against, tested against, and verified against. Without this translation, the Builder receives ambiguous direction and produces unverifiable output.
