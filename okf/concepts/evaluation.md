---
id: concept.evaluation
title: Evaluation
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - evaluation
  - metrics
  - quality
depends_on:
  - concept.artifact
  - concept.telemetry
related:
  - concept.governance
  - concept.trust
  - concept.cognitive-load
  - concept.epistemic-topology
---

## Specification

### Definition

Evaluation is the measurement of artifact and role quality at multiple levels of independence. Every artifact in a Synthetic Team receives evaluation from at least one role other than its producer.

### Evaluation Hierarchy

| Level | Type | Description |
|---|---|---|
| L0 | Role self-check | Builder runs tests |
| L1 | Peer evaluation | Reviewer examines builder |
| L2 | Independent evaluation | Truth-Teller verifies reviewer |
| L3 | Runtime evaluation | Production telemetry |
| L4 | Human evaluation | Customer outcomes |

### Evaluation Dimensions

Each artifact receives scores on:

| Dimension | Scale | Description |
|---|---|---|
| Correctness | 0–10 | Does the artifact do what it should? |
| Completeness | 0–10 | Does the artifact cover all requirements? |
| Maintainability | 0–10 | Can the artifact be modified without risk? |
| Confidence | 0–10 | How certain is the evaluator? |
| Groundedness | 0–10 | Is the artifact supported by evidence? |
| Risk | 0–10 | What is the potential negative impact? |

### Role KPIs

| Role | Primary Metrics |
|---|---|
| Truth-Teller | Verified-claim ratio, escaped-defect rate, false-positive rate, time-to-escalation |
| Analyst | Spec completeness, ambiguity count, testable-requirement ratio, rework caused by missing requirements |
| Reviewer | Review acceptance rate, defect density, maintainability findings |
| Builder | Accepted-output rate, cycle time, build success rate, reopened defects |
| Operator | Deploy success rate, MTTR, rollback frequency, infra-policy violations |
| Facilitator | Queue latency, handoff loss rate, unresolved-conflict age, trace completeness |
| Capability Planner | Role selection accuracy, topology efficiency, classification accuracy |

### Cognitive Load Metrics

Cognitive load extends evaluation by measuring whether each role's context remains within budget:

| Role | Load Dimensions | Threshold Signal |
|---|---|---|
| Builder | Files touched, dependencies, context tokens, tool invocations | Review findings increase, quality drops |
| Reviewer | Files reviewed, comments, defects, coverage breadth | Missed defects, shallow comments |
| Analyst | Requirements derived, decision records, unknowns | Ambiguity slips through |
| Truth-Teller | Claims examined, sources consulted, contradictions | Confidence inflation |

### Adversarial Metrics

| Metric | Description |
|---|---|
| Diversity Score | How many distinct solutions were proposed? |
| Objection Rate | Were assumptions challenged? Low is suspicious |
| Consensus Speed | How long until commitment? |
| Relitigation Rate | How often are settled questions reopened? |
| Execution Alignment | Once committed, did roles work together? |

---

## Rationale

Evaluation exists because unmeasured Synthetic Teams cannot improve. The evaluation hierarchy ensures that every artifact is assessed at increasing levels of independence, from self-check through human evaluation. Role-specific KPIs create accountability by making quality visible and comparable over time.
