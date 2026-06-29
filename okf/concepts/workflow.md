---
id: concept.workflow
title: Workflow
type: concept
status: stable
version: 1.1
owner: Synthetic Teams
tags:
  - workflow
  - process
  - pipeline
  - dynamic-assembly
depends_on:
  - concept.role-card
  - concept.artifact
  - concept.authority
  - concept.artifact
  - artifact.task-manifest
produces:
  - workflow.default
related:
  - concept.governance
  - concept.activation-condition
  - role.capability-planner
---

## Specification

### Definition

A workflow is an ordered sequence of stages through which work progresses, with one authority holder per stage and defined gates between stages. Workflows enforce the sequencing constraint that prevents parallel authority and preserves traceability. Workflows may be composed dynamically based on task classification and domain.

### Structure

```yaml
workflow:
  entry_conditions:
  stages:
    - role
    - role
  gates:
    - name
    - condition
  exit_conditions:
  failure_recovery:
```

### Required Elements

| Element | Description |
|---|---|
| Entry conditions | What must be true before the workflow starts |
| Ordered stages | Roles in sequence, each with exclusive authority during its stage |
| Decision gates | Validation steps that must pass before progression |
| Required artifacts | What each stage must produce |
| Approval authority | Who signs off at each gate |
| Exit conditions | What must be true for the workflow to complete |
| Failure recovery | How to handle blocked or rejected stages |

### Dynamic Team Assembly

Workflows are not limited to a fixed set of roles. The Capability Planner selects the appropriate workflow template based on the Task Manifest:

```
Facilitator (Intake) → Facilitator (Consultation) → Capability Planner → Pipeline Execution
```

The default workflow includes three phases before the core analysis-to-delivery pipeline:

1. **Intake** — Facilitator classifies and normalizes raw input into a Task Manifest
2. **Consultation** — Facilitator queries specialists for lightweight triage
3. **Team Assembly** — Capability Planner selects roles, workflow template, and artifacts

### Default Workflow

```
Facilitator (Intake + Consultation) → Capability Planner → Analyst → Builder → Reviewer → Truth-Teller → Operator
```

The Facilitator maintains continuity across all stages and resolves conflicts. The Human sponsor holds final approval for irreversible actions. The Capability Planner is invoked during team assembly and may be consulted again if reclassification is needed.

### Gates

- `review_pass` — Reviewer confirms quality standards
- `truth_pass` — Truth-Teller confirms evidence integrity
- `human_approval` — Human sponsor authorizes irreversible action

---

## Rationale

Workflows exist because simultaneous control breaks ownership clarity and auditability. When two roles hold authority over the same decision, neither can be held accountable for the outcome. Ordered handoffs ensure that every output has exactly one responsible author and one accountable approver at each stage.

Dynamic team assembly extends this principle. Rather than hardcoding a single team topology, the workflow begins with an intake and consultation phase that determines the correct set of roles for each task. This prevents the over- or under-provisioning of expertise that occurs when workflows assume a fixed team structure.
