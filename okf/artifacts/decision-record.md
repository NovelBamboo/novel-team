---
id: artifact.decision-record
title: Decision Record
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - decision
  - record
  - governance
depends_on:
  - concept.artifact
  - concept.decision-record
  - role.facilitator
consumes:
  - concept.adversarial
  - concept.governance
related:
  - artifact.adr
  - concept.trust
producer: role.facilitator
consumer: role.human, all roles (as reference)
lifecycle: Draft → Final → Archived
schema: schema.decision
validation_rules:
  - Must document the decision
  - Must include alternatives considered
  - Must include arguments for and against
  - Must document dissenting opinions
  - Must state why alternatives were rejected
  - Must be timestamped and owned
---

## Specification

### Purpose

A decision record captures a team decision with full context: the problem, alternatives, arguments, risks, dissenting opinions, and the final choice. Nothing disappears — lost arguments become institutional memory.

### Contents

```markdown
# Problem
# Alternatives Considered
# Arguments For
# Arguments Against
# Risks
# Decision
# Dissenting Opinions
# Why Rejected
# Commitment Date
```

### Trace Format

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

### Validation

- Every alternative considered must be documented
- Every dissenting opinion must be recorded
- Rationale for rejection must be explicit
- Decision must be attributed to an owner

### Lifecycle

1. **Draft** — Decision being deliberated
2. **Final** — Decision made, commitment recorded
3. **Archived** — Decision superseded or historical

### Related Workflows

- workflow.default (produced by Facilitator during governance gates)
