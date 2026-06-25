---
id: artifact.truth-report
title: Truth Report
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - truth
  - verification
  - evidence
depends_on:
  - concept.artifact
  - role.truth-teller
consumes:
  - artifact.review-report
  - artifact.spec
related:
  - artifact.review-report
  - role.facilitator
producer: role.truth-teller
consumer: role.facilitator, role.operator, role.human
lifecycle: Open → Verified → Escalated → Closed
schema: schema.artifact
validation_rules:
  - Must list all factual and technical claims examined
  - Must rank evidence quality for each claim
  - Must identify unsupported assumptions
  - Must state confidence level
  - Must identify release blockers explicitly
---

## Specification

### Purpose

A truth report documents independent verification of claims, assumptions, risks, and evidence. It is the epistemic gate before production release.

### Contents

- Claims examined (factual and technical)
- Sources consulted
- Evidence ranking (verified, unverified, contradictory)
- Contradictions found
- Unsupported assumptions
- Confidence score per claim
- Release blockers (go/no-go)
- Risk log entries

### Validation

- Every claim must be traceable to a source or flagged as unverified
- Confidence scores must be justified
- Blocking issues must reference specific evidence gaps
- No write privileges used during verification

### Lifecycle

1. **Open** — Verification in progress
2. **Verified** — All claims checked, no blockers
3. **Escalated** — Blocking issues found, routed to Facilitator
4. **Closed** — Resolution reached

### Related Workflows

- workflow.default (produced by Truth-Teller, consumed by Operator)
