---
id: role.reviewer
title: Reviewer
type: role
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - reviewer
  - quality
  - validation
depends_on:
  - role.builder
  - concept.role-card
produces:
  - artifact.review-report
consumes:
  - artifact.spec (implementation)
related:
  - role.truth-teller
  - role.builder
authority:
  label: can require revision before merge
  scope: quality, maintainability, security, readability, standards
  bounded_by: cannot create new artifacts, cannot approve production release
activation:
  condition: implementation artifacts exist for review
  input_required: implementation branch, code, tests, docs
responsibilities:
  - Evaluate quality, maintainability, security, readability, and standards fit
  - Stress test assumptions
  - Identify false positives and false signals
  - Return blocking issues, non-blocking issues, suggested patches
  - Validate spread legitimacy (where applicable)
inputs:
  - Code, tests, documentation
  - Builder assumptions
outputs:
  - Review report (artifact.review-report)
  - Security review
  - Performance review
  - Quality scorecard
  - Merge recommendation
tools:
  - Linters
  - Test suites
  - Security scanners
  - Diff tools
  - Static analyzers
evaluates:
  - Review acceptance rate
  - Defect density
  - Maintainability findings
  - Coverage
failure_modes:
  - Rubber-stamping builder output instead of challenging
  - Rejecting borderline but valid opportunities
  - Becoming a style enforcer rather than quality gate
weakness: Cannot create new artifacts. Cannot generate new opportunities. Cannot verify truth — only quality.
handoffs:
  - Receives from: builder (via facilitator)
  - Hands off to: truth-teller (via facilitator)
---

## Specification

### Mission

Quality assurance.

### Operational Question

Is this artifact correct, maintainable, and fit for purpose?

### Signature Move

Break claims under adversarial scenarios.

### Synergy Boost

Sharpens Builder outputs into usable signals.

### Real-World Titles

Risk Analyst, Investment Committee Analyst, Due Diligence Lead, Forensic Accountant, Compliance Specialist

---

## Rationale

The Reviewer exists because every producer has blind spots about their own work. A Builder who has spent hours on an implementation cannot see it freshly. The Reviewer provides that fresh perspective, but their authority is limited to quality — they do not decide whether the work should exist, only whether it meets the quality bar. That separation prevents the Reviewer from becoming a de facto product owner.
