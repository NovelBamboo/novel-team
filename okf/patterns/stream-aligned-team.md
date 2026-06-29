---
id: pattern.stream-aligned-team
title: Stream-Aligned Team
type: pattern
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - pattern
  - stream-aligned
  - topology
  - value-stream
depends_on:
  - concept.team-topology
  - concept.synthetic-teams
  - concept.team-api
implements:
  - concept.team-topology
related:
  - pattern.platform-team
  - concept.workflow
  - role.analyst
  - role.builder
  - role.reviewer
  - role.truth-teller
---

## Specification

### Problem

How do you organize synthetic work so that each team owns a complete capability from analysis through verification, without depending on external teams for every delivery?

### Solution

Organize teams around value streams rather than technology layers. Each stream-aligned team contains the core roles needed to take a task from classified intent to verified output: Analyst, Builder, Reviewer, Truth-Teller. The Operator and Facilitator remain shared platform-wide services.

### Structure

```
Stream-Aligned Team (e.g., Authentication Team)
  ├── Analyst (domain-specific)
  ├── Builder (implementation)
  ├── Reviewer (quality)
  └── Truth-Teller (verification)

Platform-wide services:
  ├── Facilitator (orchestration, state, routing)
  └── Operator (deployment, production access)
```

### Composition

| Role | Scope |
|---|---|
| Analyst | Stream-specific domain knowledge, requirements, ADRs |
| Builder | Stream-specific implementation |
| Reviewer | Stream-specific quality assessment |
| Truth-Teller | Stream-specific evidence verification |
| Facilitator | Cross-stream orchestration (shared) |
| Operator | Cross-stream deployment (shared) |

### When to Use

- Ongoing feature development in a defined domain
- Product-oriented work with clear value streams
- Any work that benefits from deep domain knowledge over generalized capability

### Interaction Mode

The stream team collaborates internally during the analysis-to-verification pipeline. It consumes platform services via X-as-a-Service and enabling advisors via Facilitating mode.

### Team API

```
Inputs:  Task Manifest (classified for this stream)
Outputs: Validated artifacts, Truth Report
Boundary: Stream owns its domain; does not own platform infrastructure
```

---

## Rationale

Stream-aligned teams exist because technology-layer organization (frontend team, backend team, infrastructure team) creates handoff overhead and diffusion of ownership. A feature requiring frontend, backend, and infrastructure changes must coordinate across three teams. A stream-aligned team owns all three capabilities within its domain, reducing handoffs to the workflow itself.

For synthetic teams, this is especially powerful because context can be optimized for the stream's domain rather than carrying general-purpose knowledge about every technology layer.