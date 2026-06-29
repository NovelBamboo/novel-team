---
id: pattern.enabling-team
title: Enabling Team
type: pattern
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - pattern
  - enabling
  - topology
  - advisor
depends_on:
  - concept.team-topology
  - concept.synthetic-teams
  - concept.team-api
implements:
  - concept.team-topology
related:
  - pattern.stream-aligned-team
  - pattern.specialist-team
  - concept.adversarial
---

## Specification

### Problem

Stream-aligned teams occasionally need expertise they do not possess and should not be expected to develop permanently. Security review, performance analysis, accessibility evaluation, and architecture guidance require specialized knowledge that would exceed the stream's cognitive budget if maintained continuously.

### Solution

Create enabling teams that increase capability by providing expertise on demand. An enabling team joins temporarily, transfers knowledge or performs analysis, then leaves. Unlike platform teams, enabling teams do not own infrastructure — they provide expertise.

### Synthetic Examples

| Enabling Role | Expertise | Typical Engagement |
|---|---|---|
| Security Advisor | Threat modeling, vulnerability assessment | Security review stage |
| Architecture Advisor | System design, trade-off analysis | ADR consultation |
| Performance Advisor | Profiling, optimization, benchmarking | Performance investigation |
| Accessibility Advisor | Accessibility standards, testing | Compliance review |
| Cost Optimization Advisor | Resource utilization, cost modeling | Cost review |

### Interaction Mode

Facilitating. The advisor joins temporarily, performs a bounded analysis, and leaves:

```
Builder → Security Advisor → Builder (with security findings)
     ↓
Security Advisor produces Security Review artifact
     ↓
Builder incorporates findings into implementation
```

### Engagement Pattern

1. **Request**: Stream team (via Facilitator) requests enabling engagement
2. **Scope**: Enabling team defines bounded scope of analysis
3. **Execute**: Enabling team performs analysis or review
4. **Deliver**: Enabling team produces findings artifact
5. **Transfer**: Knowledge is transferred to stream team
6. **Exit**: Enabling team disengages until next request

### Team API

```
Inputs:  Task context, relevant artifacts, specific questions
Outputs: Findings, recommendations, knowledge transfer artifacts
Boundary: Enabling team does not modify stream artifacts directly
```

### When to Use

- Temporary need for specialized expertise
- Capability building — stream team should learn from engagement
- High-stakes decisions warranting independent expert review
- Compliance or regulatory requirements for independent assessment

### When Not to Use

- Permanent need for capability → hire or build it into the stream
- Commodity expertise → use a platform team or tooling instead
- Ongoing monitoring → use evaluation pipelines, not enabling teams

---

## Rationale

Enabling teams exist because cognitive load is finite. A stream team focused on feature delivery cannot also maintain deep expertise in security, performance optimization, and architecture trade-offs. Rather than either fragmenting the stream's attention or accepting lower quality, enabling teams provide expert intervention on demand.

For synthetic teams, enabling is especially lightweight: the advisor loads domain-specific context, performs its analysis, produces an artifact, and releases its context. No permanent allocation is needed.