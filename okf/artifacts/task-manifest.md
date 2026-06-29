---
id: artifact.task-manifest
title: Task Manifest
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - task-manifest
  - intake
  - classification
producer: role.facilitator
consumer:
  - role.capability-planner
  - role.analyst
lifecycle: Draft → Classified → Approved → Superseded
validation_rules:
  - Must contain task type classification
  - Must identify domain
  - Must list known constraints and unknowns
  - Must reference existing related artifacts
  - Must not contain rewritten specifications
related_workflows:
  - workflow.default
depends_on:
  - concept.artifact
  - concept.workflow
---

## Specification

### Definition

A Task Manifest is the structured output of Facilitator Phase 1 (Intake). It is a normalized, classified representation of raw input — not a specification. The Facilitator performs structural analysis, not domain analysis, to produce this artifact.

### Purpose

The Task Manifest carries work from the human sponsor (via the Facilitator) to the Capability Planner for team assembly and to the Analyst for requirements definition. It ensures that every task enters the pipeline with consistent structure regardless of how the request was originally framed.

### Structure

```yaml
task_manifest:
  task:
    description: Raw summary of what was requested
  type:
    classification: bug | feature | refactor | architecture | research | incident | compliance | learning
  domain:
    classification: healthcare | finance | legal | embedded | ml | game | general
  repositories:
    - list of affected repos or services
  required_roles:
    - suggested roles (initial, refined by Capability Planner)
  known_constraints:
    - existing systems, policies, or architecture that constrain the work
  unknowns:
    - what is not yet known about the task
  artifacts:
    - artifacts that will need to be produced
  existing_artifacts:
    - relevant existing artifacts
```

### Example

```yaml
task_manifest:
  task:
    description: Add OAuth login
  type:
    classification: feature
  domain:
    classification: healthcare
  repositories:
    - auth-service
    - web-portal
  required_roles:
    - Analyst
    - Builder
    - Security Reviewer
    - HIPAA Reviewer
    - Truth-Teller
  known_constraints:
    - Existing SSO
    - Audit logging required
    - PHI protection
  unknowns:
    - OAuth provider
    - MFA requirements
  artifacts:
    - PRD
    - ADR
    - Acceptance Tests
```

### Properties

| Property | Description |
|---|---|
| Producer | Facilitator |
| Consumer | Capability Planner, Analyst |
| Lifecycle | Draft → Classified → Approved → Superseded |
| Content | Task metadata only — no rewritten specification |

### Relationship to Other Artifacts

```
Intent (raw input)
    │
    ▼
Task Manifest (Facilitator Phase 1 — classification only)
    │
    ├──▶ Capability Planner (team topology)
    │
    └──▶ Analyst (requirements → Spec)
```

---

## Rationale

The Task Manifest exists because raw input is not a specification. Before any domain work begins, the request must be normalized, classified, and structured so that the appropriate team can be assembled and the appropriate workflow selected. Without a Task Manifest, the Facilitator attempts to perform every role — or worse, rewrites the specification itself, bypassing the Analyst role entirely.

The Task Manifest enforces a separation between intake (classification) and analysis (specification). The Facilitator classifies; the Analyst specifies. This prevents role collapse at the entry point of the pipeline.
