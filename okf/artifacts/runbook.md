---
id: artifact.runbook
title: Runbook
type: artifact
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - runbook
  - operations
  - deployment
depends_on:
  - concept.artifact
  - role.operator
consumes:
  - artifact.truth-report
  - artifact.review-report
related:
  - role.operator
  - concept.telemetry
producer: role.operator
consumer: role.operator, role.human
lifecycle: Draft → Reviewed → Active → Superseded
schema: schema.artifact
validation_rules:
  - Must contain step-by-step execution instructions
  - Must include rollback procedures
  - Must document success criteria
  - Must list required permissions and access
---

## Specification

### Purpose

A runbook documents the operational procedures for deploying, running, monitoring, and recovering a system in production.

### Contents

- Deployment steps
- Configuration parameters
- Monitoring setup
- Rollback procedures
- Incident response steps
- Success criteria
- Required permissions
- Contacts and escalation paths

### Validation

- Every step must be executable by someone with documented access
- Rollback procedures must be tested
- Success criteria must be observable
- Runbook must be versioned with the system it describes

### Lifecycle

1. **Draft** — Initial procedures documented by Operator
2. **Reviewed** — Peer-reviewed for correctness and completeness
3. **Active** — Currently used for operations
4. **Superseded** — New runbook replaces this one

### Related Workflows

- workflow.default (produced by Operator during execution stage)
