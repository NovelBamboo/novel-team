---
id: example.software-team
title: Software Development Team — Example
type: example
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - example
  - software
  - engineering
depends_on:
  - concept.synthetic-teams
implements:
  - workflow.default
related:
  - pattern.trusted-advisor
---

## Context

A software development team building a new feature. The team operates as a Synthetic Team with explicit role separation, artifact-first workflow, and governance gates.

## Role Assignments

| Role | Team Member | Artifacts |
|---|---|---|
| Analyst | Product Manager / Tech Lead | PRD, user stories, acceptance criteria, ADRs |
| Builder | Software Engineer | Code, tests, documentation |
| Reviewer | Senior Engineer | Code review, quality scorecard |
| Truth-Teller | QA / Security Engineer | Test results, security audit, verification report |
| Operator | DevOps / SRE | Deployment, monitoring, rollback plan |
| Facilitator | Engineering Manager / Scrum Master | Task tracking, decision log, escalation |

## Workflow

```
1. Analyst: Convert feature request into spec, acceptance tests, ADRs, task graph
2. Gate: Spec approved by Facilitator and Tech Lead
3. Builder: Implement against spec, write tests, document
4. Gate: All tests pass, build succeeds
5. Reviewer: Code review for correctness, maintainability, security
6. Gate: Review approved (blocking issues resolved)
7. Truth-Teller: Verify claims, check security, validate against spec
8. Gate: Truth report clear (no evidence gaps)
9. Operator: Deploy to staging, run integration tests
10. Gate: Human approval for production
11. Operator: Deploy to production, monitor, document runbook
```

## Artifact Graph

```
Feature Request
    ↓
PRD, Spec, ADRs, Task Graph  (Analyst)
    ↓
Code, Tests, Docs             (Builder)
    ↓
Review Report                 (Reviewer)
    ↓
Truth Report, Security Audit  (Truth-Teller)
    ↓
Deploy Log, Runbook           (Operator)
    ↓
Telemetry, Outcome Report     (All)
```

## Governance

- Every PR must reference a spec item
- Every merge requires review approval
- Every production deploy requires truth-teller sign-off + human approval
- Every incident produces a decision record
