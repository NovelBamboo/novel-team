---
id: concept.workflow
title: Workflow
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - workflow
  - process
  - pipeline
depends_on:
  - concept.role-card
  - concept.artifact
  - concept.authority
produces:
  - workflow.default
related:
  - concept.governance
  - concept.activation-condition
---

## Specification

### Definition

A workflow is an ordered sequence of stages through which work progresses, with one authority holder per stage and defined gates between stages. Workflows enforce the sequencing constraint that prevents parallel authority and preserves traceability.

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

### Default Workflow

```
Analyst → Builder → Reviewer → Truth-Teller → Operator
```

The Facilitator maintains continuity across all stages and resolves conflicts. The Human sponsor holds final approval for irreversible actions.

### Gates

- `review_pass` — Reviewer confirms quality standards
- `truth_pass` — Truth-Teller confirms evidence integrity
- `human_approval` — Human sponsor authorizes irreversible action

---

## Rationale

Workflows exist because simultaneous control breaks ownership clarity and auditability. When two roles hold authority over the same decision, neither can be held accountable for the outcome. Ordered handoffs ensure that every output has exactly one responsible author and one accountable approver at each stage.
