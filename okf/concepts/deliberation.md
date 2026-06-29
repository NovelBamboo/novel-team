---
id: concept.deliberation
title: Deliberation Cycle
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - deliberation
  - decision
  - cycle
  - framework
depends_on:
  - concept.synthetic-teams
  - concept.workflow
  - concept.governance
  - concept.trust
produces:
  - workflow.deliberation
related:
  - concept.evaluation
  - concept.adversarial
  - concept.role-card
  - concept.authority
  - concept.decision-record
---

## Specification

### Definition

The Deliberation Cycle is the core decision-making process of a Synthetic Team. It governs how the team evaluates options, challenges assumptions, builds consensus, and commits to a course of action. Unlike production workflows, deliberation does not assume an artifact is being created — it works for any decision context.

### Phases

| Phase | Primary Question | Primary Role |
|---|---|---|
| Observe | What is the current state? | Analyst |
| Diagnose | Why is this happening? What matters? | Analyst + Truth-Teller |
| Challenge | What are we missing? What could go wrong? | Reviewer |
| Decide | What do we choose? | Facilitator |
| Commit | What will we do? Who owns it? | Operator + Facilitator |

### When Deliberation Applies

The Deliberation Cycle is always active. Every recommendation, decision, or course of action passes through these phases. The cycle is invoked when the team is:

- Evaluating options
- Deciding priorities
- Challenging assumptions
- Assessing risk
- Building consensus
- Monitoring execution

### Relationship to Production

Production workflows (such as ADREI) execute within the commitment phase of deliberation. The deliberation cycle determines *what* to do and *whether* to do it; production workflows determine *how* to build it.

```
Deliberation Cycle (always active)
│
├── Observe → Diagnose → Challenge → Decide → Commit
│                                         │
│                                         └── Production Workflow (if creating something)
│                                                 ADREI, Software, Research, etc.
│
└── Feedback → Observe (next cycle)
```

### Continuous Loop

The cycle is not linear — it is a continuous feedback loop. Execution outcomes feed into the next Observe phase, creating organizational learning:

- Every commit produces evidence
- Evidence informs the next Observe
- Past decisions are revisited when new evidence appears

### Role Participation

| Phase | Primary | Supporting |
|---|---|---|
| Observe | Analyst | Truth-Teller |
| Diagnose | Analyst | Truth-Teller |
| Challenge | Reviewer | Truth-Teller |
| Decide | Facilitator | All roles |
| Commit | Operator | Facilitator, Builder |

---

## Rationale

Deliberation exists because not every team activity produces an artifact. Evaluating options, assessing risk, building consensus, and deciding priorities are core functions that do not fit a Draft → Review → Edit cycle. The Deliberation Cycle separates *how decisions are made* from *how work is executed*, allowing the framework to center on epistemic quality — evidence, challenge, and commitment — while production workflows handle domain-specific execution.

This separation aligns with the evolution toward a Trusted Advisor model. The team's primary function is trustworthy decision-making; artifact production is one specialized output among many.
