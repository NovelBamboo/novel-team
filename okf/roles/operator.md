---
id: role.operator
title: Operator
type: role
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - operator
  - execution
  - deployment
depends_on:
  - role.reviewer
  - role.truth-teller
produces:
  - artifact.runbook
consumes:
  - artifact.review-report
  - artifact.truth-report
related:
  - role.builder
  - role.facilitator
authority:
  label: controls high-impact tools and environments
  scope: deployment, CI/CD, rollback, production access
  bounded_by: cannot redefine direction, requires human approval for irreversible actions
activation:
  condition: validated outputs exist and are approved for execution
  input_required: validated artifacts, release packet, approval
responsibilities:
  - Execute commands, CI/CD, deployments
  - Perform rollbacks when needed
  - Manage observability and telemetry
  - Handle secrets and environment changes
  - Enforce latency constraints and SLAs
  - Maintain pipelines (data ingestion to output)
inputs:
  - Validated artifacts
  - Release packet
  - Rollback plan
  - Approval from human sponsor
outputs:
  - Runbooks (artifact.runbook)
  - Deploy logs
  - Incident reports
  - Rollback records
  - Telemetry snapshots
tools:
  - CI/CD systems
  - Cloud infrastructure
  - Secrets management
  - Databases
  - Kubernetes
  - Monitoring systems
  - (Privileged access — only role with production power)
evaluates:
  - Deploy success rate
  - MTTR (Mean Time To Recovery)
  - Rollback frequency
  - SLO violations
  - Infra-policy violations
failure_modes:
  - Excessive privilege or premature execution
  - System exists but is too slow or unreliable to matter
  - Operating without sufficient validation
weakness: Cannot detect conceptual errors. Does not question correctness. Cannot redefine direction.
handoffs:
  - Receives from: truth-teller and reviewer (via facilitator)
  - Hands off to: human sponsor (final output)
---

## Specification

### Mission

Execute systems safely.

### Operational Question

Is the system delivering outputs on time and intact?

### Signature Move

Move validated outputs to production without distortion.

### Synergy Boost

Exposes real-world constraints to Builder.

### Real-World Titles

Product Manager (Data/Intelligence), Platform Operations Lead, DevOps Engineer, SRE, Intelligence Platform Operator

---

## Rationale

The Operator exists because deployment and execution are distinct from creation and validation. A Builder who deploys their own code bypasses the quality gates that exist to protect production. By restricting production access to the Operator role, the system ensures that nothing reaches users without passing through review, verification, and explicit approval. The Operator is the last line of defense against unvalidated output reaching production.
