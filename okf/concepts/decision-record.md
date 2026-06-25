---
id: concept.decision-record
title: Decision Record
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - decision
  - record
  - audit
depends_on:
  - concept.governance
  - concept.workflow
produces:
  - artifact.decision-record
related:
  - concept.trust
  - concept.adversarial
---

## Specification

### Definition

A decision record is a structured document that captures a decision, the alternatives considered, the arguments for and against, the associated risks, and any dissenting opinions. Nothing disappears — lost arguments become institutional memory.

### Required Fields

```yaml
decision_record:
  problem: string
  alternatives_considered:
    - option
    - option
  arguments_for:
    - argument
  arguments_against:
    - argument
  risks:
    - risk
  decision: string
  dissenting_opinions:
    - opinion
  why_rejected:
    - reason
  commitment_date: timestamp
  decision_owner: role
```

### Trace Fields

```json
{
  "proposal": "",
  "alternatives": [],
  "objections": [],
  "counterarguments": [],
  "decision": "",
  "decision_owner": "",
  "commitment_timestamp": ""
}
```

---

## Rationale

Decision records exist because undiscussed decisions cannot be challenged and unchallenged decisions compound error. By forcing every decision to record its alternatives, risks, and dissenting opinions, the system ensures that future operators can reconstruct why a choice was made and whether the reasoning still holds.
