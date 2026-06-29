---
id: pattern.platform-team
title: Platform Team
type: pattern
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - pattern
  - platform
  - topology
  - shared-services
depends_on:
  - concept.team-topology
  - concept.synthetic-teams
  - concept.team-api
implements:
  - concept.team-topology
related:
  - pattern.stream-aligned-team
  - concept.workflow
  - concept.evaluation
  - concept.telemetry
---

## Specification

### Problem

Every stream-aligned team needs common infrastructure: model routing, prompt management, evaluation pipelines, trace storage, artifact schemas, and deployment tooling. When each team builds its own, the organization fragments on incompatible solutions and duplicated effort.

### Solution

Create platform teams that own shared capabilities and expose them via well-defined APIs. Stream teams consume platform capabilities without needing to understand platform internals.

### Synthetic Platform Examples

**Developer Platform:**
- Repo templates and scaffolding
- CLI tools
- Spec generation utilities
- Coding standards and linters
- CI/CD templates

**AI Platform:**
- Model routing and fallback
- LiteLLM integration
- MCP server management
- Prompt versioning and caching
- Evaluation framework
- Cost tracking

**Observability Platform:**
- OpenTelemetry collection
- Trace storage and querying
- Dashboard generation
- Metric aggregation
- Alert routing

### Platform API Contract

Every platform team exposes:

```
Capability: [what it provides]
Interface: [how to consume it]
SLA: [performance guarantees]
Cost: [resource consumption model]
Ownership: [platform team owns; stream team does not fork]
```

### Interaction Mode

X-as-a-Service. The stream team consumes platform outputs without discussion. If the platform does not meet stream needs, the stream escalates via the Facilitator rather than building a parallel platform.

```
Builder → AI Platform → Model response
Builder → Observability Platform → Trace ingestion
Builder → Developer Platform → Project scaffold
```

### When to Use

- Any capability duplicated across three or more streams
- Infrastructure that requires deep expertise to operate correctly
- Capabilities where standardization provides network effects

### Anti-Patterns

- **Platform as a gate**: Platform must not block stream delivery — provide self-service where possible
- **Platform as a monolith**: Split into independently evolvable sub-platforms
- **Platform by accident**: A shared utility library is not a platform team

---

## Rationale

Platform teams exist because unconstrained autonomy leads to fragmentation. Without platform teams, every stream builds its own evaluation pipeline, its own prompt manager, its own deployment tooling — each slightly different, each with its own bugs, each consuming context that should be spent on stream-specific work.

Platform teams are not about control. They are about cognitive load reduction: a stream team should not need to think about model routing, trace storage, or prompt versioning. That cognitive load belongs to the platform team, where it can be optimized once and shared across the organization.