---
id: reference.glossary
title: Glossary
type: reference
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - glossary
  - vocabulary
  - reference
---

## Canonical Terms

| Term | Definition | See Also |
|---|---|---|
| Activation Condition | Observable condition that triggers a role to become active | concept.activation-condition |
| Cognitive Load | Primary design constraint measuring context window load per role | concept.cognitive-load |
| Dynamic Topology | Runtime reconfiguration of active role composition based on workload | concept.dynamic-topology |
| Enabling Team | Pattern where expertise joins temporarily to increase capability | pattern.enabling-team |
| Epistemic Topology | Structure governing how knowledge is challenged, validated, and accepted — orthogonal to organizational topology | concept.epistemic-topology |
| Adversarial Protocol | System of structured opposition during deliberation and unity during execution | concept.adversarial |
| Analyst | Role that converts intent into explicit, testable requirements | role.analyst |
| Architecture Decision Record | Document capturing a significant architectural decision and its rationale | artifact.adr |
| Artifact | Structured, versioned, inspectable output produced by a role | concept.artifact |
| Artifact-First Principle | Work is carried between roles via committed artifacts, not conversation | concept.artifact |
| Authority | Bounded decision right assigned to a role within a workflow stage | concept.authority |
| Builder | Role that produces implementation from accepted specifications | role.builder |
| Capability Planner | Role that converts Task Manifest into Team Topology — owns domain detection, role selection, workflow templates, and governance rules | role.capability-planner |
| Decision Gate | Validation step that must pass before work progresses to the next stage | concept.workflow |
| Decision Record | Document capturing a team decision with alternatives, arguments, and dissenting opinions | artifact.decision-record |
| Evaluation | Measurement of artifact and role quality at multiple levels of independence | concept.evaluation |
| Facilitator | Role that orchestrates workflow, preserves state, and routes tasks | role.facilitator |
| Governance | Rules constraining how a Synthetic Team operates and makes decisions | concept.governance |
| Operator | Role that executes commands, deployments, and production actions | role.operator |
| Organizational Memory | Durable record of every artifact with explicit ownership assigned to exactly one role | concept.organizational-memory |
| Persona Layer | Optional narrative wrapper for recall and usability | concept.persona-layer |
| Platform Team | Pattern providing shared infrastructure capabilities via well-defined APIs | pattern.platform-team |
| Reviewer | Role that evaluates quality, maintainability, security, and standards | role.reviewer |
| Role Card | Constrained role definition with persona and operational layers | concept.role-card |
| RoleCard Layer | Authoritative execution model within a Role Card | concept.rolecard-layer |
| Runbook | Documented operational procedures for production systems | artifact.runbook |
| Spec | Executable requirements document produced by the Analyst | artifact.spec |
| Specialist Team | Pattern owning deep expertise in a narrow complicated subsystem | pattern.specialist-team |
| Stream-Aligned Team | Pattern organizing roles around value streams rather than technology layers | pattern.stream-aligned-team |
| Synthetic Team | Role-constrained system governing human+AI work production | concept.synthetic-teams |
| Team API | Predictable interface every role exposes — formalized inputs, outputs, and contracts | concept.team-api |
| Team Topology | Structure governing how work is partitioned across roles and teams | concept.team-topology |
| Task Graph | Ordered decomposition of spec into assigned, dependent tasks | artifact.task-graph |
| Task Manifest | Normalized, classified representation of raw input produced by Facilitator intake — not a specification | artifact.task-manifest |
| Telemetry | Observable output of traces, artifacts, evaluations, and tool executions | concept.telemetry |
| Truth-Teller | Role that independently verifies claims, assumptions, risks, and evidence | role.truth-teller |
| Trust | Measurable outcome of visible reasoning, explicit trade-offs, and distributed accountability | concept.trust |
| Workflow | Ordered sequence of stages with gates and one authority holder per stage | concept.workflow |

## Deprecated Terms

| Deprecated Term | Canonical Replacement |
|---|---|
| Auditor | Reviewer |
| Coordinator | Facilitator |
| Creator | Builder |
| Deliverable | Artifact |
| Developer | Builder |
| Implementer | Builder |
| Inspector | Reviewer |
| Orchestrator | Facilitator |
| Pipeline | Workflow |
| Process | Workflow |
| QA | Reviewer |
| Reality Auditor | Truth-Teller |
| Runner | Operator |
| SOP | Workflow |
| Verifier | Truth-Teller |
| Technology Team | Stream-Aligned Team |
