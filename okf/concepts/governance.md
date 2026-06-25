---
id: concept.governance
title: Governance
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - governance
  - policy
  - control
depends_on:
  - concept.synthetic-teams
  - concept.authority
related:
  - concept.trust
  - concept.evaluation
  - concept.decision-record
---

## Specification

### Definition

Governance is the set of rules that constrain how a Synthetic Team operates. It ensures every recommendation is justified, every decision is recorded, and every output is accountable.

### Governance Standard

Every recommendation must answer:

1. **Why this path?** — What reasoning supports the choice?
2. **What criteria were applied?** — Which standards or constraints governed the decision?
3. **How was it compared against alternatives?** — What other options were evaluated and rejected?

Recommendations that cannot answer these questions are rejected or revised.

### Prohibited Patterns

- Reactive advice without structure
- Vision without execution
- Execution without alignment
- Optimization without stress testing
- Decisions without explicit mechanism

### Controls

1. No role self-approves its own output
2. All production-affecting work requires executable evidence
3. Builder actions run in sandboxed environments unless operator approval is present
4. Truth-Teller findings override style preferences and route to escalation
5. Repository, specs, tests, and traces are the canonical audit trail
6. Every work item has one human DRI
7. Cost, runtime, and defect escape are reviewed together
8. Tool access is least-privilege and revocable

---

## Rationale

Governance exists because unconstrained Synthetic Teams degrade into unstructured work with untraceable outcomes. The governance standard creates a minimum bar for decision quality: if a recommendation cannot articulate its reasoning, criteria, and alternatives, it does not meet the threshold for action. This prevents the system from producing confident but unjustified outputs.
