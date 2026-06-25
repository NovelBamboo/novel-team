---
id: artifact.task-graph
title: Task Graph
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - task
  - graph
  - planning
depends_on:
  - concept.artifact
  - role.analyst
consumes:
  - artifact.spec
related:
  - role.builder
  - role.facilitator
producer: role.analyst
consumer: role.facilitator, role.builder
lifecycle: Draft → Approved → Executed → Completed
schema: schema.artifact
validation_rules:
  - Must decompose spec into executable tasks
  - Must show dependencies between tasks
  - Must assign each task to a role
  - Must include estimated effort or complexity
---

## Specification

### Purpose

A task graph decomposes a spec packet into ordered, assigned, executable tasks with explicit dependencies.

### Contents

- Task list with identifiers
- Dependencies between tasks
- Role assignments per task
- Estimated complexity or effort
- Sequencing constraints

### Validation

- Every task must trace to a spec requirement
- Dependencies must be acyclic
- Every task must have exactly one assigned role
- Task graph must be executable by following dependency order

### Lifecycle

1. **Draft** — Initial decomposition by Analyst
2. **Approved** — Facilitator approves the plan
3. **Executed** — Builder works through tasks
4. **Completed** — All tasks finished and verified

### Related Workflows

- workflow.default (produced by Analyst, consumed by Builder and Facilitator)
