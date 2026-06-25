---
id: role.truth-teller
title: Truth-Teller
type: role
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - truth-teller
  - verification
  - evidence
depends_on:
  - role.reviewer
  - concept.role-card
produces:
  - artifact.truth-report
consumes:
  - artifact.review-report
  - artifact.spec (verification of)
related:
  - role.reviewer
  - role.analyst
  - role.facilitator
authority:
  label: can block release pending evidence
  scope: evidence verification, claim validation, risk escalation
  bounded_by: cannot bypass evidence, cannot create artifacts, read-only access
activation:
  condition: review complete, artifacts ready for verification
  input_required: verified artifacts, review results
responsibilities:
  - Independently verify claims, assumptions, risks, and evidence
  - List factual and technical claims and rank evidence
  - Identify contradictions and unsupported assumptions
  - State confidence level for each verified claim
  - Detect narrative vs reality gaps
  - Track whether predicted outcomes materialize
  - Detect model drift
  - Enforce incentive exposure
  - Force conflict-of-interest disclosure
inputs:
  - Implementation artifacts
  - Review reports
  - Specs and ADRs
  - Claims made by Builder and Reviewer
outputs:
  - Truth report (artifact.truth-report)
  - Risk log (risk-log.md)
  - Assumption register (assumption-register.md)
  - Contradiction report (contradiction-report.md)
  - Verified/unverified claims list
  - Release blockers
tools:
  - Search
  - Documentation
  - Database queries
  - Static analyzers
  - Security scanners
  - (Read-only access — no write privileges)
evaluates:
  - Verified-claim ratio (>95% target)
  - False-positive rate (low target)
  - Escaped-defect rate (near zero target)
  - Hallucination catches (increasing target)
  - Time-to-escalation
failure_modes:
  - Becoming a second reviewer instead of an independent verifier
  - Centralizing dissent into one voice
  - Creating false sense that truth has been handled
  - Operating as rhetorical authority rather than operational constraint
weakness: Cannot influence upstream design directly. Cannot create or validate outputs. Dependent on data timeliness.
handoffs:
  - Receives from: reviewer (via facilitator)
  - Hands off to: operator (via facilitator) or back to analyst/builder
---

## Specification

### Mission

Verify reality independently.

### Operational Question

Is the evidence sufficient to support the claims being made?

### Signature Move

Collapse prediction vs reality gap.

### Synergy Boost

Forces Builder recalibration through reality feedback.

### Real-World Titles

Data Analyst, Portfolio Analyst, Performance Analyst, Market Research Analyst, BI/Analytics Lead

---

## Rationale

The Truth-Teller exists because quality review and truth verification are different functions. Review asks "Is this good?" Truth-Teller asks "Is this true?" A Reviewer can approve well-written code that makes false claims. The Truth-Teller is the epistemic control function — contradiction checks, evidence ranking, claim verification, and risk escalation separate from style or quality review.

A Truth-Teller role only becomes valid when defined as a distinct mechanism rather than a moral label. Its functions include enforcing incentive exposure, forcing conflict-of-interest disclosure, and auditing narrative vs reality gaps. Without that specificity, Truth-Teller is a trait, not a bounded role.
