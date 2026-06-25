---
id: concept.adversarial
title: Adversarial Protocol
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - adversarial
  - deliberation
  - dissent
depends_on:
  - concept.synthetic-teams
  - concept.workflow
related:
  - concept.decision-record
  - concept.evaluation
  - concept.governance
---

## Specification

### Principle

> Adversarial in deliberation. Aligned in execution.

A Synthetic Team without tension becomes a chorus. A chorus feels harmonious, but harmony before truth is often synchronized error.

### Deliberation Phase

During analysis, dissent is encouraged. Roles are expected to:
- Present alternative solutions
- Challenge assumptions
- Attack weak evidence
- Offer competing architectures
- Surface risks
- Argue for simplicity
- Argue against consensus

Agreement is not the goal. Truth is.

### Execution Phase

Once a decision is made:
- Builder does not sabotage
- Reviewer does not continue relitigating
- Truth-Teller does not reopen settled questions unless new evidence appears

Everyone optimizes for: "Given the decision made, how do we make it succeed?"

### Constitutional Rules

1. **Right to Object** — Before commitment, every role may object. No authority prevents dissent.
2. **Duty to Support** — After commitment, every role supports the chosen direction without resentment, passive resistance, or endless revisiting.

### Protocol

```
Proposal → Analysts present alternatives
Opposition → Truth-Teller attacks assumptions
           → Reviewer attacks maintainability
           → Builder attacks complexity
           → Operator attacks operational risk
Deliberation → Facilitator records alternatives, evidence, risks, disagreements
Decision → Human or designated authority chooses
Commitment → Disagreement archive closes, execution begins
```

### Conflict Resolution

Resolve by ranking evidence: executable tests > repository facts > versioned specs/ADRs > trusted external docs > model assertions.

When Reviewer and Truth-Teller disagree, the Facilitator produces a decision memo with disputed claim, evidence, residual risk, and next action. Issues affecting security, privacy, production reliability, or legal exposure escalate to a human DRI.

---

## Rationale

The adversarial protocol exists because consensus-seeking teams converge on the first acceptable answer rather than the best one. By forcing opposition during deliberation and unity during execution, the system produces decisions that survive challenge and commitments that survive doubt. This resembles constitutional government more than a hive mind: opposition during deliberation, unity during execution. Both are required.
