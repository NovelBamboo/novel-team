---
id: concept.authority
title: Authority
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - authority
  - control
  - governance
depends_on:
  - concept.workflow
related:
  - concept.activation-condition
  - concept.governance
---

## Specification

### Definition

Authority is the bounded decision right assigned to a role within a workflow stage. Every role has exclusive authority over its domain and no authority outside it. Authority must be explicit, bounded, and non-overlapping.

### Decision Rights

| Decision Type | Authority |
|---|---|
| Reversible | Delegate with logging |
| Costly but reversible | Reviewer + Operator concurrence |
| Irreversible or regulated | Explicit human approval after Truth-Teller sign-off |

### Hard Authorities by Role

| Role | Authority |
|---|---|
| Truth-Teller | Can block release pending evidence |
| Analyst | Can freeze scope until ambiguity is resolved |
| Reviewer | Can require revision before merge |
| Builder | No unilateral production release |
| Operator | Controls high-impact tools and environments |
| Facilitator | Can pause workflow; cannot self-approve content quality |

### Constraints

- No role may exercise authority outside its stage
- No role may override another role's authority within its stage
- No role may self-approve its own output
- Authority must map to observable decisions

---

## Rationale

Authority boundaries exist because overlapping control produces unaccountable outcomes. When everyone can approve, no one is responsible for approval. By assigning one authority holder per stage, the system ensures that every decision has a known owner and every failure has a known source.
