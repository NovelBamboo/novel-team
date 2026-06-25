---
id: concept.activation-condition
title: Activation Condition
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - activation
  - trigger
  - workflow
depends_on:
  - concept.workflow
  - concept.role-card
related:
  - concept.authority
---

## Specification

### Definition

An activation condition defines when a role becomes active within a workflow. It prevents premature or inappropriate execution by ensuring roles only act when their required inputs are available and the preceding stage is complete.

### Activation Conditions by Role

| Role | Activation Condition |
|---|---|
| Analyst | New intent, policy, or problem statement received |
| Builder | Spec packet available and accepted |
| Reviewer | Implementation artifacts exist for review |
| Truth-Teller | Review complete, artifacts ready for verification |
| Operator | Validated outputs exist, approved for execution |
| Facilitator | Continuous — maintains state across all stages |

### Properties

- Condition must be observable (can be checked programmatically)
- Condition must be unambiguous (binary yes/no)
- Condition must be traceable (recorded in workflow state)
- Role is inactive when condition is not met

---

## Rationale

Activation conditions exist because roles operating without their required inputs produce low-quality or contradictory outputs. A Builder cannot build without a spec; a Reviewer cannot review without code. By tying activation to artifact availability, the system ensures each role receives the inputs it needs and cannot act prematurely.
