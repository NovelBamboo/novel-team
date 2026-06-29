---
id: workflow.default
title: Default Workflow
type: workflow
status: stable
version: 1.1
owner: Synthetic Teams
tags:
  - workflow
  - default
  - pipeline
  - dynamic-assembly
depends_on:
  - concept.workflow
  - role.facilitator
  - role.capability-planner
  - role.analyst
  - role.builder
  - role.reviewer
  - role.truth-teller
  - role.operator
related:
  - concept.adversarial
  - concept.governance
  - concept.artifact
  - artifact.task-manifest
entry_conditions:
  - Raw intent received from human sponsor
  - Human available for consultation if needed
stages:
  - role: role.facilitator
    phase: intake
    produces:
      - artifact.task-manifest
    authority: Classify and normalize input; do not rewrite specification
  - role: role.facilitator
    phase: consultation
    produces:
      - consultation responses
    authority: Query specialists in parallel for triage; bounded to lightweight assessment
  - role: role.capability-planner
    produces:
      - team topology
      - workflow selection
    authority: Select roles and workflow for task; cannot modify task scope
  - role: role.analyst
    produces:
      - artifact.spec
      - artifact.adr
      - artifact.task-graph
    authority: Freeze scope until ambiguity is resolved
  - role: role.builder
    produces:
      - commits
      - tests
      - docs
    authority: No unilateral production release
  - role: role.reviewer
    produces:
      - artifact.review-report
    authority: Can require revision before merge
  - role: role.truth-teller
    produces:
      - artifact.truth-report
    authority: Can block release pending evidence
  - role: role.operator
    produces:
      - artifact.runbook
      - deploy logs
    authority: Controls high-impact tools and environments
gates:
  - name: review_pass
    condition: Reviewer confirms quality standards
    approving_role: role.reviewer
  - name: truth_pass
    condition: Truth-Teller confirms evidence integrity
    approving_role: role.truth-teller
  - name: human_approval
    condition: Human sponsor authorizes irreversible action
    approving_role: role.human
required_artifacts:
  - artifact.task-manifest
  - artifact.spec
  - artifact.adr
  - artifact.review-report
  - artifact.truth-report
exit_conditions:
  - Output delivered to human sponsor
  - All artifacts versioned and stored
  - Trace spans closed
  - Decision record archived
  - Organizational learning updated
failure_recovery:
  on_reject: Return to preceding stage with rejection rationale
  on_block: Escalate to human sponsor via Facilitator
  escalation_path: role.facilitator → role.human
---

## Specification

### Flow

```mermaid
sequenceDiagram
    participant H as Human sponsor
    participant F as Facilitator
    participant CP as Capability Planner
    participant A as Analyst
    participant B as Builder
    participant R as Reviewer
    participant T as Truth-Teller
    participant O as Operator

    H->>F: Submit raw intent
    Note over F: Phase 1: Intake
    F->>F: Classify, normalize, identify domain
    Note over F: Consultation (parallel triage)
    F->>F: Query Security, Compliance, Operator, Truth-Teller
    F-->>F: Consultation responses
    F->>CP: Task Manifest
    Note over CP: Team Assembly
    CP->>CP: Select roles, workflow, artifacts
    CP-->>F: Team topology
    F->>A: Create spec, tests, ADRs, task graph
    A-->>F: Spec packet
    F->>B: Implement against accepted spec
    B-->>F: Code, docs, tests, branch
    F->>R: Quality / maintainability review
    R-->>F: Review report, required changes
    F->>T: Independent verification and risk audit
    T-->>F: Evidence report, contradiction log, go/no-go
    alt Evidence insufficient or risk unresolved
        F->>A: Clarify assumptions / revise spec
        F->>B: Rework with updated packet
    else Evidence sufficient
        F->>O: Deploy to staging / production gate
        O-->>H: Release packet, telemetry, rollback plan
        H->>O: Final approval for irreversible actions
    end
```

### Role Sequence

```
Human → Facilitator (Intake) → Facilitator (Consultation) → Capability Planner (Assembly) → Analyst → Builder → Reviewer → Truth-Teller → Operator → Human
```

### Phase Details

**Phase 1 — Intake (Facilitator):**
- Accept raw input from human sponsor
- Perform structural analysis (not domain analysis)
- Classify task type, domain, existing artifacts
- Produce Task Manifest

**Phase 2 — Consultation (Facilitator):**
- Query specialists in parallel: Security, Compliance, Operator, Truth-Teller
- Short, bounded assessments — not full analyses
- Responses inform team composition

**Phase 3 — Team Assembly (Capability Planner):**
- Detect domain and required expertise
- Select core + domain-specific roles
- Select workflow template
- Define required artifacts
- Return team topology to Facilitator

### Gate Logic

- If `review_pass` fails → return to Builder with Reviewer findings
- If `truth_pass` fails → return to Analyst or Builder with Truth-Teller findings
- If `human_approval` withheld → return to Facilitator for resolution
- All gates must pass for production release

### Continuous Role

The Facilitator maintains continuity across all stages. The Facilitator does not hold stage authority but ensures handoffs complete, state is preserved, and escalations reach the human sponsor. The Capability Planner is invoked once during team assembly and may be consulted again if task reclassification is required.
