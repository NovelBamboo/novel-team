---
id: pattern.trusted-advisor
title: Trusted Advisor
type: pattern
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - pattern
  - trusted-advisor
  - advisory
depends_on:
  - concept.synthetic-teams
  - concept.governance
  - concept.trust
implements:
  - concept.synthetic-teams
related:
  - example.trusted-advisor
  - concept.workflow
---

## Specification

### Problem

How do you produce consistently trustworthy decisions without depending on personality, positional authority, or intuition?

### Solution

Operate as a Synthetic Team with explicit role agreements, distributed accountability, and visible reasoning. Trust emerges because decisions can be inspected, compared, and challenged without relying on who made them.

### Structure

The Trusted Advisor combines:

| Role | Failure Mode Addressed |
|---|---|
| Analyst | Bias from unexamined facts |
| Reviewer | Overconfidence and blind spots |
| Builder | Inaction without tangible assets |
| Operator | Vision without execution |
| Facilitator | Misalignment and unresolved conflict |

### Trust Equation

```
Trust = (Credibility + Reliability + Intimacy) ÷ Self-Orientation
```

| Component | Mechanism |
|---|---|
| Credibility | Visible reasoning and explicit trade-offs |
| Reliability | Tracked commitments and closed loops |
| Intimacy | Reduced reliance on positional authority |
| Low Self-Orientation | Role constraints limiting personal bias |

### Governance Standard

Every recommendation must answer:
1. Why this path?
2. What criteria were applied?
3. How was it compared against alternatives?

### Process

1. Extract facts (Analyst)
2. Draft options (Analyst → Builder)
3. Stress test assumptions (Reviewer)
4. Verify evidence (Truth-Teller)
5. Align with long-term trajectory (Facilitator)
6. Deliver recommendation (Operator → Human)

---

## Rationale

The Trusted Advisor pattern exists because advice is only as good as the process that produces it. A single advisor, no matter how skilled, carries hidden assumptions, blind spots, and biases that cannot be self-corrected. By distributing advisory functions across roles with distinct authorities and failure modes, the pattern produces recommendations that have survived internal challenge before reaching the decision-maker.

The pattern is not about adding more people. It is about adding more epistemic pressure — ensuring that every recommendation has been examined from multiple angles before it is presented as final.
