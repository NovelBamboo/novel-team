---
id: artifact.review-report
title: Review Report
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - review
  - quality
  - report
depends_on:
  - concept.artifact
  - role.reviewer
consumes:
  - artifact.spec (implementation)
related:
  - artifact.truth-report
  - role.builder
producer: role.reviewer
consumer: role.truth-teller, role.facilitator, role.builder
lifecycle: Open → Resolved → Closed
schema: schema.artifact
validation_rules:
  - Must categorize findings by severity (blocking, non-blocking)
  - Must include specific recommendations
  - Must include merge recommendation
---

## Specification

### Purpose

A review report documents the findings of a quality review, including blocking issues, non-blocking issues, and recommendations.

### Contents

- Review scope and artifacts examined
- Blocking issues (must fix before proceed)
- Non-blocking issues (should fix)
- Suggested patches or fixes
- Quality scorecard
- Merge recommendation (approve, changes requested, rejected)

### Validation

- Every finding must reference specific code or artifact
- Severity must be justified
- Merge recommendation must be explicit

### Lifecycle

1. **Open** — Review initiated, findings being documented
2. **Resolved** — Issues addressed or explicitly waived
3. **Closed** — Review complete, outcome recorded

### Related Workflows

- workflow.default (produced by Reviewer, consumed by Truth-Teller)
