---
id: workflow.adrei
title: ADREI Production Workflow
type: workflow
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - workflow
  - production
  - adrei
  - artifact
  - content
depends_on:
  - concept.deliberation
  - concept.workflow
  - concept.governance
  - concept.artifact
  - role.analyst
  - role.builder
  - role.reviewer
  - role.facilitator
  - role.operator
related:
  - workflow.deliberation
  - workflow.default
  - concept.adversarial
  - concept.evaluation
entry_conditions:
  - A decision to produce an artifact has been made (commitment phase of deliberation)
  - The artifact type is known (specification, code, design, report, article, documentation)
  - The Facilitator has assembled the appropriate production roles
stages:
  - phase: Analyze
    role: role.analyst
    produces:
      - artifact.spec
      - requirements
      - constraint list
    authority: Convert intent into explicit requirements and constraints
  - phase: Draft
    role: role.builder
    produces:
      - artifact
      - implementation
      - first version
    authority: Produce the artifact against accepted requirements
  - phase: Review
    role: role.reviewer
    produces:
      - artifact.review-report
      - revision requests
    authority: Evaluate quality and require changes
  - phase: Edit
    role: role.builder
    produces:
      - revised artifact
      - change log
    authority: Address review findings within scope
  - phase: Integrate
    role: role.operator
    produces:
      - artifact.runbook
      - integration record
    authority: Publish, merge, or deliver the final artifact
gates:
  - name: requirements_accepted
    condition: Requirements are explicit, testable, and agreed
    approving_role: role.facilitator
  - name: review_pass
    condition: Artifact meets quality standards
    approving_role: role.reviewer
  - name: edit_complete
    condition: All critical review findings addressed
    approving_role: role.reviewer
required_artifacts:
  - artifact.spec
  - artifact.review-report
exit_conditions:
  - Final artifact delivered and integrated
  - Review findings resolved or documented as deferred
  - Artifact versioned and stored
  - Integration record added to organizational memory
failure_recovery:
  on_reject: Return to Draft with rejection rationale
  on_block: Escalate to human sponsor via Facilitator
  escalation_path: role.facilitator → role.human
---

## Specification

### Context

ADREI is a production workflow that executes within the commitment phase of the Deliberation Cycle. It is one implementation pattern for producing artifacts — not the core operating model of the Synthetic Team.

```
Deliberation Cycle
│
├── Decide → "We will build X"
│
└── Commit → ADREI (Analyze → Draft → Review → Edit → Integrate)
```

### Flow

```mermaid
sequenceDiagram
    participant A as Analyst
    participant B as Builder
    participant R as Reviewer
    participant O as Operator

    Note over A: Analyze
    A->>A: Convert intent into requirements and constraints
    A-->>B: Spec packet
    Note over B: Draft
    B->>B: Produce artifact against accepted requirements
    B-->>R: Draft artifact
    Note over R: Review
    R->>R: Evaluate quality, identify issues
    R-->>B: Review report, revision requests
    Note over B: Edit
    B->>B: Address review findings
    B-->>O: Revised artifact
    Note over O: Integrate
    O->>O: Publish, merge, or deliver
    O-->>A: Integration evidence (feeds learning)
```

### Phase Details

**Phase 1 — Analyze (Analyst):**
- Convert intent into explicit requirements and constraints
- Define acceptance criteria
- Identify dependencies and risks
- Gate: requirements_accepted — requirements are testable and agreed

**Phase 2 — Draft (Builder):**
- Produce the artifact against accepted requirements
- First version — not expected to be final
- Respect constraints defined during analysis

**Phase 3 — Review (Reviewer):**
- Evaluate quality, maintainability, completeness
- Identify defects and improvement areas
- Gate: review_pass — artifact meets minimum quality bar

**Phase 4 — Edit (Builder):**
- Address review findings
- Revise the artifact
- May require multiple edit cycles
- Gate: edit_complete — all critical findings addressed

**Phase 5 — Integrate (Operator):**
- Publish, merge, submit, or deliver the final artifact
- Record the integration in organizational memory
- Feed outcomes back into the Deliberation Cycle

### When to Use ADREI

ADREI is appropriate when the output is an artifact:
- Article, report, or documentation
- Code or software component
- Design or specification
- Analysis or research output

ADREI is not appropriate when the team is:
- Evaluating options without producing an artifact
- Building consensus or deciding priorities
- Monitoring execution or assessing risk

In those cases, use the Deliberation Cycle directly.

### Role Sequence

```
Analyst → Builder → Reviewer → Builder → Operator
```

The Builder appears twice (Draft and Edit) but with different authority:
- Draft: produce first version against requirements
- Edit: address review findings within scope
