---
id: concept.synthetic-teams
title: Synthetic Teams
type: concept
status: stable
version: 1.1
owner: Synthetic Teams
tags:
  - synthetic-teams
  - framework
  - collaboration
  - human-ai
  - pipeline
  - information-topology
depends_on:
  - concept.role-card
  - concept.workflow
  - concept.authority
  - concept.governance
  - concept.artifact
  - concept.deliberation
produces:
  - concept.trust
  - workflow.deliberation
  - workflow.adrei
related:
  - concept.activation-condition
  - concept.evaluation
  - concept.telemetry
  - concept.cognitive-load
  - concept.team-topology
  - concept.team-api
  - concept.organizational-memory
  - concept.dynamic-topology
  - concept.epistemic-topology
  - role.capability-planner
  - artifact.task-manifest
  - pattern.stream-aligned-team
  - pattern.platform-team
  - pattern.enabling-team
  - pattern.specialist-team
---

## Specification

### Definition

A Synthetic Team is an information processing pipeline, not an organizational chart. It is a role-constrained system that governs how humans and AI transform representations — from raw intent through verified evidence to running systems and organizational learning. The system exists to constrain contribution, assign responsibility, make outputs traceable, and convert nonlinear human thought into linear execution.

### Core Principles

1. **Information Processing Pipeline**: The synthetic team is modeled after a compiler pipeline, not a management hierarchy. Every role transforms one representation into another. The question is always "What transformation is needed next?" not "Who reports to whom?"

2. **Three Orthogonal Dimensions**: A Synthetic Team is defined by three independent topologies:
   - **Organizational topology** — roles, ownership, interaction modes, and capability composition
   - **Information topology** — flow and transformation of artifacts, traces, evaluations, and evidence
   - **Decision topology** — how proposals are generated, challenged, selected, executed, and revisited when new evidence appears

3. **AI as Collaborator**: AI is assigned bounded responsibilities limited to defined production functions.

4. **Output Accountability**: All outputs must meet explicit accountability conditions or be removed.

5. **Workflow Constraints**: Work progresses through ordered stages with one authority holder per stage, and decisions are blocked until defined validation steps are satisfied.

6. **Humans Think Nonlinearly**: Humans should be free to think nonlinearly. The synthetic organization is responsible for converting nonlinear thought into linear execution. This allows creativity to remain unconstrained while ensuring implementation remains structured, traceable, and repeatable.

### The Pipeline Model

| Role | Transformation |
|---|---|
| Facilitator | Intent → Task Manifest |
| Capability Planner | Task Manifest → Team Topology |
| Analyst | Task Manifest → Requirements |
| Builder | Design → Implementation |
| Reviewer | Implementation → Quality Assessment |
| Truth-Teller | Claims → Verified Evidence |
| Operator | Release → Running System |

Every role transforms one representation into another. This is closer to a compiler pipeline than a project management workflow. The role is defined by the transformation it performs, not by its position in a hierarchy.

### Interaction Modes

1. **Person ↔ Person** — direct collaboration
2. **Person ↔ AI** — guided interaction
3. **AI ↔ Process** — automated execution against predefined rules

### Core and Domain Roles

The framework defines a set of core roles that exist in almost every project and domain-specific roles that are loaded as needed — similar to an operating system loading drivers based on detected hardware.

**Core Roles:**
- Facilitator (always active)
- Capability Planner
- Analyst
- Builder
- Reviewer
- Truth-Teller
- Operator

**Domain Roles (loaded as needed):**
| Domain | Roles |
|---|---|
| Healthcare | Clinical SME, HIPAA Expert, Medical Terminology Reviewer |
| Finance | Risk Analyst, Regulatory Expert, Fraud Specialist |
| Legal | Legal SME, Evidence Specialist, Chain-of-Custody Reviewer |
| Embedded Systems | Real-Time Expert, Safety Engineer |
| Machine Learning | Data Scientist, Model Evaluator, Bias Reviewer |
| Game Development | Gameplay Designer, Performance Specialist, UX Reviewer |

### Topologies (Dynamic)

Team composition is not predefined. The Facilitator classifies the task, the Capability Planner selects the appropriate roles, and the team is assembled dynamically for each task:

```
Human → Facilitator (classify & normalize)
         → Capability Planner (select roles & workflow)
         → Team Assembly (instantiate selected roles)
         → Execution (pipeline stages)
```

### Implementation Model

1. Classify the task type and domain
2. Consult specialists for lightweight triage
3. Select capability profile (roles, workflow, artifacts)
4. Assemble the team dynamically
5. Execute through ordered pipeline stages
6. Evaluate and feed back into organizational learning

### Framework Layers

The Synthetic Team Framework is organized into three operational layers:

#### Layer 1 — Governance (always active)
JOA / JOAT: Every recommendation must be Justifiable, Observable, Auditable, and Trustworthy. This never changes.

#### Layer 2 — Deliberation (always active)
The Deliberation Cycle (Observe → Diagnose → Challenge → Decide → Commit) governs how the team evaluates options, challenges assumptions, and commits to decisions. Every role participates. This is the heart of the framework.

#### Layer 3 — Production (optional, artifact-dependent)
Production workflows execute within the commitment phase of deliberation. ADREI (Analyze → Draft → Review → Edit → Integrate) is one production workflow, suitable for creating articles, code, designs, specifications, reports, and documentation.

### Execution Model

- Diagnose gaps in execution
- Balance functional roles
- Prevent over-reliance on creation without validation
- Route through the smallest sufficient team

---

## Rationale

### Origin

AI introduces speed and scale without inherent responsibility. Explicit constraints are required to maintain coherence and control. The pipeline model ensures that every transformation is accountable to the next consumer in the chain.

### Why Pipeline Over Hierarchy

Organizational charts optimize for reporting relationships. Pipelines optimize for information quality. When a synthetic team is modeled as a pipeline:
- **Which agents should exist?** → What transformations are needed?
- **Who reports to whom?** → What evidence is missing?
- **Which agent starts first?** → What artifact should be produced?

The questions shift from authority to information flow, which makes the system observable, auditable, and resilient.

### Cognitive Load Management

- Intrinsic load handled through task decomposition
- Extraneous load reduced via constrained roles
- Germane load reserved for human judgment and decision-making

### Core Insight

Unstructured collaboration fails due to role ambiguity and uncontrolled interaction. Synthetic Teams enforces defined responsibility, constrained action, and ordered interaction. Failures become localized, decisions become traceable, and output remains controllable. Without enforcement, it degrades into unstructured work with untraceable outcomes.
