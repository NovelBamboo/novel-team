---
id: workflow.deliberation
title: Deliberation Cycle Workflow
type: workflow
status: stable
version: 1.0
owner: Synthetic Teams
tags:
  - workflow
  - deliberation
  - decision
  - cycle
depends_on:
  - concept.deliberation
  - concept.workflow
  - concept.governance
  - concept.trust
  - role.builder
  - role.operator
  - role.analyst
  - role.reviewer
  - role.facilitator
  - role.truth-teller
related:
  - workflow.adrei
  - concept.evaluation
  - concept.adversarial
  - concept.decision-record
  - artifact.decision-record
entry_conditions:
  - A decision, recommendation, or course of action is required
  - Team is assembled with appropriate roles
stages:
  - phase: Observe
    role: role.analyst
    produces:
      - situation report
      - evidence summary
      - signal extraction
    authority: Gather and structure evidence without interpretation
  - phase: Diagnose
    role: role.analyst
    produces:
      - problem frame
      - option analysis
      - hypothesis set
    authority: Frame the problem and generate options
  - phase: Challenge
    role: role.reviewer
    produces:
      - challenge report
      - risk assessment
      - contradiction log
    authority: Test assumptions and expose risks
  - phase: Decide
    role: role.facilitator
    produces:
      - artifact.decision-record
    authority: Synthesize input and record the decision
  - phase: Commit
    role: role.operator
    produces:
      - commitment record
      - task assignment
    authority: Translate decision into accountable execution
gates:
  - name: evidence_sufficient
    condition: Evidence is structured and complete enough to diagnose
    approving_role: role.analyst
  - name: challenge_satisfied
    condition: All critical assumptions tested and risks exposed
    approving_role: role.reviewer
  - name: decision_recorded
    condition: Decision recorded with rationale, alternatives, and criteria
    approving_role: role.facilitator
required_artifacts:
  - artifact.decision-record
exit_conditions:
  - Decision recorded with explicit rationale
  - Alternatives documented and compared
  - Commitments assigned with owners
  - Decision record archived in organizational memory
  - Evidence fed back into Observe for next cycle
failure_recovery:
  on_reject: Return to Diagnose with rejection rationale
  on_block: Escalate to human sponsor via Facilitator
  escalation_path: role.facilitator → role.human
---

## Specification

### Flow

```mermaid
sequenceDiagram
    participant A as Analyst
    participant S as Analyst
    participant R as Reviewer
    participant F as Facilitator
    participant O as Operator

    Note over A: Observe
    A->>A: Gather evidence, extract signals
    A-->>F: Situation report
    Note over S: Diagnose
    S->>S: Frame problem, generate options
    S-->>F: Problem frame + options
    Note over R: Challenge
    R->>R: Stress test assumptions, identify risks
    R-->>F: Challenge report
    Note over F: Decide
    F->>F: Synthesize, record decision
    F-->>O: Decision record
    Note over O: Commit
    O->>O: Assign owners, define next actions
    O-->>A: Execution evidence (feeds next Observe)
```

### Phase Details

**Phase 1 — Observe (Analyst):**
- Gather evidence and structure it
- Extract signals from available data
- Identify what is known and unknown
- Gate: evidence_sufficient — evidence must be structured enough for diagnosis

**Phase 2 — Diagnose (Analyst + Truth-Teller):**
- Frame the problem
- Generate and evaluate options
- Identify root causes and leverage points
- Truth-Teller verifies factual basis of diagnosis

**Phase 3 — Challenge (Reviewer):**
- Stress test assumptions underlying each option
- Identify hidden risks, contradictions, and blind spots
- Ensure recommendations have survived internal challenge
- Gate: challenge_satisfied — all critical assumptions tested

**Phase 4 — Decide (Facilitator):**
- Synthesize input from all roles
- Record decision with rationale, alternatives considered, and criteria applied
- Produce decision record artifact
- Gate: decision_recorded — decision is documented and auditable

**Phase 5 — Commit (Operator):**
- Translate decision into accountable execution
- Assign owners and define next actions
- Feed execution evidence back into Observe for continuous learning

### Governance

Every decision must satisfy JOA/JOAT:
- **Justifiable** — Can the reasoning be articulated?
- **Observable** — Can the inputs and outputs be inspected?
- **Auditable** — Can the decision be traced and challenged?
- **Trustworthy** — Does it meet the governance standard?

### Role Sequence

```
Analyst → Analyst (Diagnose) → Reviewer → Facilitator → Operator
```

### Gate Logic

- If `evidence_sufficient` fails → Analyst continues gathering
- If `challenge_satisfied` fails → Return to Diagnose with challenge findings
- If `decision_recorded` withheld → Return to Facilitator for resolution
- All gates must pass for commitment
