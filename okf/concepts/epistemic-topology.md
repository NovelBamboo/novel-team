---
id: concept.epistemic-topology
title: Epistemic Topology
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - epistemic-topology
  - knowledge
  - verification
  - truth
  - challenge
depends_on:
  - concept.synthetic-teams
  - concept.truth-teller
  - concept.adversarial
  - concept.evaluation
related:
  - concept.team-topology
  - concept.governance
  - concept.trust
  - concept.team-api
  - concept.cognitive-load
---

## Specification

### Definition

Epistemic topology is the structure governing how knowledge is generated, challenged, validated, and accepted within a synthetic team. It is orthogonal to organizational topology: organizational topology answers "who does the work," while epistemic topology answers "how do we know the work is correct?"

Two independent structures define the synthetic organization:

| Organizational Topology | Epistemic Topology |
|---|---|
| Who owns work | Who verifies claims |
| Interaction modes | Evidence contracts |
| Team boundaries | Decision rights |
| Cognitive load distribution | Confidence budgets |
| Conway's Law for communication | Information flow control |
| Stream-aligned teams | Independent verification |
| Platform teams | Truth-Teller function |
| Enabling teams | Expert challengers |

### Elements

#### 1. Independent Verification

Every claim must be verified by a role that did not produce it. This extends the existing no-self-approval rule into a positive requirement:

- Every output has at least one independent verifier
- The verifier must have read access to all evidence
- The verifier must not have participated in production
- Verification confidence is expressed as a numeric score

#### 2. Evidence Contracts

Every claim defines what evidence would be sufficient to support it:

```
Claim: "The authentication service handles 10K RPM"
Evidence contract:
  - Load test results with sustained 10K RPM
  - P50/P95/P99 latency at that load
  - Resource utilization at that load
  - Error rate at that load
```

Claims that cannot specify an evidence contract are treated as assumptions.

#### 3. Confidence Budgets

Every role has a confidence budget — a limit on how much uncertainty it can tolerate. When confidence in a claim falls below threshold:

1. The claim is flagged as an assumption
2. The assumption is documented with its confidence score
3. Downstream roles are informed of the confidence level
4. The decision to proceed with low-confidence assumptions is escalated

#### 4. Expert Challengers

For high-risk claims, domain experts are activated as challengers:

- Security claims → Security Expert challenges
- Performance claims → Performance Expert challenges
- Compliance claims → Compliance Expert challenges
- Mathematical claims → Domain Mathematician challenges

Challengers operate via the adversarial protocol.

#### 5. Information Flow Control

Epistemic topology constrains how information flows between roles:

- **Write isolation**: Only the producing role writes to an artifact
- **Read access**: Roles may read only artifacts relevant to their transformation
- **Challenge rights**: Any role may challenge a claim, but only designated roles have verification authority
- **Escalation path**: Unresolved challenges follow governance escalation

### Relationship to Truth-Teller

The Truth-Teller is the epistemic control function within the organizational topology. Epistemic topology generalizes this by defining the complete system of knowledge validation:

- Truth-Teller handles routine verification
- Expert challengers handle domain-specific claims
- Evidence contracts define verification criteria upfront
- Confidence budgets set tolerances for uncertainty
- The adversarial protocol provides the deliberation mechanism

### Combined Architecture

A healthy synthetic organization requires both topologies:

```
Organizational Topology (who)
  │
  ├── Stream-aligned teams execute work
  ├── Platform teams provide services
  └── Enabling/specialist teams provide expertise
        │
        ▼
Epistemic Topology (how we know)
  │
  ├── Truth-Teller verifies claims
  ├── Expert challengers test assumptions
  ├── Evidence contracts define criteria
  ├── Confidence budgets set tolerances
  └── Adversarial protocol governs deliberation
```

Neither topology alone is sufficient. Organizational topology without epistemic topology produces efficient error. Epistemic topology without organizational topology produces analysis without execution.

---

## Rationale

Epistemic topology exists because organizational topology alone cannot guarantee output quality. An efficiently organized team can produce consistently wrong results if its knowledge validation is weak. By modeling how claims are generated, challenged, and verified as a distinct architectural layer, the framework ensures that both execution and epistemic integrity remain explicit, observable, and measurable.

This is the defining characteristic of the framework: it scales not just work execution but reasoning quality. The combination of organizational and epistemic topology is well suited to AI-driven engineering organizations because both dimensions degrade gracefully — when either weakens, the other provides detection and recovery paths.