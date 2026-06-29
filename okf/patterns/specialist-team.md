---
id: pattern.specialist-team
title: Specialist Team
type: pattern
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - pattern
  - specialist
  - topology
  - complicated-subsystem
depends_on:
  - concept.team-topology
  - concept.synthetic-teams
  - concept.team-api
implements:
  - concept.team-topology
related:
  - pattern.stream-aligned-team
  - pattern.enabling-team
  - concept.cognitive-load
---

## Specification

### Problem

Some knowledge domains are too specialized for every stream to master. Compiler optimization, cryptography, GPU programming, distributed consensus, and ML model optimization require deep expertise that exceeds the cognitive budget of a general-purpose Builder.

### Solution

Create specialist teams that own deep expertise in a narrow, complicated domain. Unlike enabling teams that temporarily advise, specialist teams own the subsystem and provide it as a service. The stream team defines requirements; the specialist team produces the implementation.

### Synthetic Examples

| Specialist Domain | Ownership |
|---|---|
| Compiler Optimization | Owns compiler passes, IR transformations, code generation |
| Cryptography | Owns encryption, signing, key management implementation |
| GPU Programming | Owns CUDA kernels, GPU memory management, shader optimization |
| Distributed Consensus | Owns consensus protocol implementation, fault tolerance |
| ML Optimization | Owns model quantization, pruning, distillation |
| Real-Time Systems | Owns scheduling guarantees, latency budgets, deadline enforcement |

### Interaction Mode

X-as-a-Service with optional collaboration. The stream team provides requirements via the standard Analyst interface; the specialist team implements and delivers:

```
Stream Analyst → Specialist Input Contract → Specialist Team → Stream Builder
```

### Team API

```
Inputs:  Specification, acceptance criteria, interface contract
Outputs: Specialist implementation, tests, documentation
Boundary: Specialist team owns the subsystem; stream team owns integration
```

### Engagement Patterns

**Black-box:**
Stream provides spec → specialist produces implementation → stream integrates
*(Use when interface is well-defined)*

**Guided:**
Stream provides intent → specialist refines spec → specialist implements → stream integrates
*(Use when domain knowledge is needed to write correct spec)*

**Collaborative:**
Stream + specialist work jointly on spec → specialist implements → stream integrates
*(Use for novel or high-risk work)*

### When to Use

- Domain requires deep expertise acquired over extended periods
- Error cost is high (cryptography, safety-critical systems)
- The domain has low breadth but high depth
- Stream team cannot evaluate specialist output without specialist training

### When Not to Use

- Expertise is broadly available → keep in stream team
- Domain is stable and well-documented → use platform team or library
- Work is exploratory → use enabling team instead

---

## Rationale

Specialist teams exist because some domains require more cognitive investment than a general-purpose role can sustain. A Builder implementing a consensus protocol must understand distributed systems theory, failure modes, liveness guarantees, and performance trade-offs — cognitive load that would dominate the Builder's context and degrade their primary function.

By isolating complicated subsystems into specialist teams, the framework ensures that deep expertise is concentrated where it is needed and does not contaminate every role with domain knowledge that most tasks do not require. This is a direct application of the cognitive load design constraint: each role should carry only the expertise needed for its transformation.