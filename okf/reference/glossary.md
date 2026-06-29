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
| Persona Layer | Optional narrative wrapper for recall and usability | concept.persona-layer |
| Reviewer | Role that evaluates quality, maintainability, security, and standards | role.reviewer |
| Role Card | Constrained role definition with persona and operational layers | concept.role-card |
| RoleCard Layer | Authoritative execution model within a Role Card | concept.rolecard-layer |
| Runbook | Documented operational procedures for production systems | artifact.runbook |
| Spec | Executable requirements document produced by the Analyst | artifact.spec |
| Synthetic Team | Role-constrained system governing human+AI work production | concept.synthetic-teams |
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
