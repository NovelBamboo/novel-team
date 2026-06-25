---
id: example.trusted-advisor
title: Trusted Advisor — Example
type: example
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - example
  - trusted-advisor
  - advisory
depends_on:
  - pattern.trusted-advisor
implements:
  - pattern.trusted-advisor
---

## Context

A client presents an ambiguous strategic challenge. The system must produce a structured, auditable recommendation.

## Role Assignments

| Role | Persona | Function |
|---|---|---|
| Analyst | Policy Signal Extractor | Extract facts from client input |
| Builder | Strategy Translator | Convert facts into options |
| Reviewer | Assumption Tester | Stress test each option |
| Truth-Teller | Evidence Verifier | Verify claims independently |
| Operator | Delivery Lead | Ensure recommendation lands |
| Facilitator | Engagement Lead | Maintain trust and alignment |

## Workflow

```
1. Client submits problem statement
2. Analyst extracts facts and frames options
3. Builder develops each option with trade-offs
4. Reviewer stress-tests assumptions
5. Truth-Teller verifies evidence independently
6. Facilitator compiles recommendation with decision record
7. Operator delivers recommendation with governance standard met
8. Client receives: recommendation, alternatives considered, evidence table, risk assessment
```

## Output

- Recommendation packet
- Alternatives considered with rationale
- Evidence table with confidence scores
- Risk assessment
- Decision record (for the team's own decision on what to recommend)
