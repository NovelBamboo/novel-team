---
id: concept.team-topology
title: Team Topology
type: concept
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - team-topology
  - stream-aligned
  - platform
  - enabling
  - specialist
  - interaction-mode
depends_on:
  - concept.synthetic-teams
  - concept.role-card
  - concept.cognitive-load
  - concept.team-api
produces:
  - concept.dynamic-topology
related:
  - concept.workflow
  - concept.artifact
  - role.capability-planner
  - pattern.stream-aligned-team
  - pattern.platform-team
  - pattern.enabling-team
  - pattern.specialist-team
---

## Specification

### Definition

Team topology is the structure governing how work is partitioned across roles and teams in a synthetic organization. Where organizational charts model reporting relationships, team topologies model information flow, cognitive load distribution, and interaction patterns.

### Four Topology Types

#### 1. Stream-Aligned Team

Organized around value streams rather than technology layers. Each stream owns a complete capability from analysis through verification.

Synthetic example:
```
Feature Team → Analyst + Builder + Reviewer + Truth-Teller

Authentication Team → Analyst + Builder + Reviewer + Truth-Teller

Payments Team → Analyst + Builder + Reviewer + Truth-Teller
```

The Operator and Facilitator remain platform-wide services shared across streams.

**When to use:** Ongoing feature development, product-oriented work.

#### 2. Platform Team

Provides shared infrastructure that every team needs. Prevents each stream from building its own version of common capabilities.

Synthetic platform examples:

| Platform | Capabilities |
|---|---|
| Developer Platform | Repo templates, CLI, spec generation, coding standards |
| AI Platform | Model routing, LiteLLM, MCP, caching, prompt versions, evaluations |
| Observability Platform | Tracing, OpenTelemetry, dashboards, metrics, alerts |

**When to use:** Any capability duplicated across three or more streams.

**Interaction mode:** X-as-a-Service. Streams consume platform outputs without needing to understand platform internals.

#### 3. Enabling Team

Increases capability of other teams by providing expertise on demand. Unlike platform teams, enabling teams do not own infrastructure — they provide knowledge.

Synthetic examples:
- Security Advisor
- Architecture Advisor
- Performance Advisor
- Accessibility Advisor
- Cost Optimization Advisor

**Interaction mode:** Facilitating. The advisor joins temporarily, increases capability, then leaves.

```
Builder → Performance Advisor → Builder (with improved output)
```

**When to use:** A stream needs specialized knowledge that it does not need permanently.

#### 4. Specialist Team (Complicated Subsystem)

Owns deep expertise in a narrow domain that is too specialized for every Builder to master.

Synthetic examples:
- Compiler optimization
- Cryptography
- GPU programming
- Distributed consensus
- ML optimization

**Interaction mode:** X-as-a-Service with collaboration as needed.

**When to use:** Knowledge domain has high depth and low breadth of application.

### Interaction Modes

Every topology interaction follows one of three modes:

| Mode | Duration | Example | API Required |
|---|---|---|---|
| Collaboration | Temporary | Analyst + Builder + Reviewer working jointly | Shared workspace |
| X-as-a-Service | Ongoing | Builder → Telemetry Platform | Defined input/output contract |
| Facilitating | Temporary | Builder → Security Advisor → Builder | Lightweight consultation |

### Team Boundaries

Each role has explicit visibility boundaries that prevent information leakage:

| Role | May Read | Cannot Read |
|---|---|---|
| Builder | Specs, code, tests | Production secrets, deployment credentials |
| Operator | Deployment config, logs, metrics | Requirements intent |
| Truth-Teller | Everything (read-only) | May not modify |
| Reviewer | Implementation, tests, spec | Production data |

### Conway's Law for Synthetic Teams

Synthetic organizations produce communication structures that mirror their team topology. If every role talks to every other role, the result is unstructured coupling. The topology constrains communication:

```
Analyst → Builder → Reviewer → Truth-Teller → Operator
```

Only the Facilitator has global visibility. This reduces communication complexity from O(n²) to O(n).

### Team Cognitive Budget

Every role has a cognitive budget ceiling derived from cognitive load measurements. When any role approaches its budget ceiling, the topology should be adjusted:

1. **Split** the role into sub-roles (e.g., Analyst → Business Analyst + Technical Analyst)
2. **Introduce** intermediate roles to reduce dependency span
3. **Reclassify** the work to a different topology type

---

## Rationale

Team topology exists because how work is partitioned determines how well it scales. A monolithic team carrying every responsibility will exceed its cognitive load threshold and produce degraded output. By explicitly modeling four topology types, the framework provides a vocabulary for deciding how to partition work and when to adjust.

The topology types are not mutually exclusive. A healthy synthetic organization uses all four: stream-aligned teams for value delivery, platform teams for shared infrastructure, enabling teams for capability growth, and specialist teams for deep expertise. The Capability Planner selects the appropriate topology for each task.