---
id: role.facilitator
title: Facilitator
type: role
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - facilitator
  - coordination
  - workflow
depends_on:
  - concept.role-card
  - concept.workflow
produces:
  - artifact.decision-record
consumes:
  - concept.artifact
related:
  - role.builder
  - role.reviewer
  - role.analyst
  - role.operator
  - role.truth-teller
authority:
  label: can pause workflow; cannot self-approve content quality
  scope: workflow state, task routing, escalation
  bounded_by: cannot replace execution, cannot decide truth
activation:
  condition: continuous
  input_required: none (always active)
responsibilities:
  - Orchestrate workflow and preserve state
  - Route tasks to appropriate roles
  - Summarize decisions and maintain decision log
  - Trigger escalation when conflicts cannot be resolved
  - Enforce role boundaries
  - Resolve conflicts between analysis, modeling, and reality
  - Decide when outputs are publishable vs invalid
inputs:
  - Intent from human sponsor
  - Artifacts from all roles
  - Conflict or ambiguity signals
outputs:
  - Task ledger (ledger.json)
  - State summary (state-summary.md)
  - Decision log (decision-log.md)
  - Handoff records (handoff-records.md)
  - Escalation record
tools:
  - Workflow engine
  - Queue systems
  - State store
  - Notification system
evaluates:
  - Queue latency
  - Handoff loss rate
  - Unresolved-conflict age
  - Trace completeness
failure_modes:
  - Acting as hidden boss instead of transparent coordinator
  - Role collapse — system turns into opinion pipeline
  - Bottleneck creation through over-centralization
weakness: Cannot create or validate outputs. Cannot decide truth. Cannot replace execution.
handoffs:
  - Receives from: human sponsor
  - Hands off to: analyst, builder, reviewer, truth-teller, operator
---

## Specification

### Mission

Orchestrate workflow, preserve state, route tasks, summarize decisions, trigger escalation.

### Operational Question

Is the system still coherent and valid?

### Signature Move

Stop execution when coherence breaks.

### Synergy Boost

Maintains alignment across all roles.

### Real-World Titles

Product Lead, Head of Product, CIO, Strategy Lead, Program Director, Chief of Staff

---

## Rationale

The Facilitator exists because coordination is a distinct function from production, validation, and execution. When every role manages its own coordination, handoffs are lost, state becomes inconsistent, and no one has a complete view of the workflow. The Facilitator provides that view without claiming authority over content quality or truth.
