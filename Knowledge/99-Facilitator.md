The Facilitator should not be thought of as a manager. It should be thought of as an **operating system kernel**.

Its job is not to solve the problem. Its job is to determine **what kind of problem exists**, assemble the appropriate team, establish the workflow, and maintain the system state.

## The Facilitator has two phases

### Phase 1: Intake (always)

Every task enters through the Facilitator.

Raw input:

```
Need to add OAuth.
```

or

```
Users complain that search is slow.
```

or

```
HIPAA audit findings require changes.
```

The Facilitator performs structural analysis, not domain analysis.

It identifies:

- What is being requested?
    
- Is this a bug, feature, refactor, architecture change, research task, incident, compliance task, etc.?
    
- What artifacts already exist?
    
- What repositories and services are involved?
    
- What unknowns exist?
    
- What domain does this appear to belong to?
    

At this point, nothing has been rewritten into a specification. The Facilitator has simply classified and normalized the request.

---

### Phase 2: Team Assembly

Only after classification does it decide:

> Which expertise is required?

For example:

```
Healthcare Feature
```

may require:

- Analyst
    
- Builder
    
- Reviewer
    
- Truth-Teller
    
- Security Reviewer
    
- Privacy Reviewer
    
- Clinical SME
    
- Compliance Expert
    
- Operator
    

A legal discovery system might instead require:

- Analyst
    
- Builder
    
- Reviewer
    
- Truth-Teller
    
- Legal SME
    
- Evidence Chain Reviewer
    
- Privacy Reviewer
    

A compiler optimization task might require:

- Analyst
    
- Builder
    
- Performance Expert
    
- Compiler Expert
    
- Reviewer
    

The team is **composed dynamically**, not predefined.

---

# The Facilitator Should Consult Specialists Early

This is where I would extend the earlier design.

Rather than rewriting the task alone, the Facilitator performs a **lightweight consultation**.

For example:

```
Human

↓

Facilitator

↓

"What expertise is needed?"
```

It might query several specialists in parallel.

Security Expert

```
Does this request have security implications?
```

Compliance Expert

```
Does this fall under HIPAA?
```

Operator

```
Does this affect production infrastructure?
```

Truth-Teller

```
Are there factual ambiguities or missing evidence?
```

These are short, bounded consultations—not full analyses.

---

# Think of It as a Triage Board

In a hospital, the triage nurse doesn't diagnose every disease. The nurse determines:

- urgency,
    
- destination,
    
- specialists needed,
    
- immediate risks.
    

The Facilitator serves the same purpose.

It should not become a bottleneck by trying to perform every role.

---

# Domain-Specific Team Topologies

This is where the framework becomes extensible.

Instead of a fixed team:

```
Facilitator
Analyst
Builder
Reviewer
Truth
Operator
```

think in terms of a core plus plugins.

## Core roles

These exist in almost every project:

- Facilitator
    
- Analyst
    
- Builder
    
- Reviewer
    
- Truth-Teller
    
- Operator
    

## Domain roles

Loaded as needed:

Healthcare:

- Clinical SME
    
- HIPAA Expert
    
- Medical Terminology Reviewer
    

Finance:

- Risk Analyst
    
- Regulatory Expert
    
- Fraud Specialist
    

Legal:

- Legal SME
    
- Evidence Specialist
    
- Chain-of-Custody Reviewer
    

Embedded Systems:

- Real-Time Expert
    
- Safety Engineer
    

Machine Learning:

- Data Scientist
    
- Model Evaluator
    
- Bias Reviewer
    

Game Development:

- Gameplay Designer
    
- Performance Specialist
    
- UX Reviewer
    

The Facilitator loads these much like an operating system loads drivers based on detected hardware.

---

# The Facilitator Should Not Rewrite Everything

This is another refinement I'd make.

The Facilitator should produce a **Task Manifest**, not a full specification.

For example:

```yaml
Task:
  Add OAuth login

Type:
  Feature

Domain:
  Healthcare

Repositories:
  auth-service
  web-portal

Required Roles:
  Analyst
  Builder
  Security Reviewer
  HIPAA Reviewer
  Truth-Teller

Known Constraints:
  Existing SSO
  Audit logging
  PHI protection

Unknowns:
  OAuth provider
  MFA requirements

Artifacts:
  PRD
  ADR
  Acceptance Tests
```

The Analyst then converts this into detailed requirements.

---

# The Facilitator Should Learn Team Topologies

One capability I think is missing from many current agent frameworks is **organizational learning**.

Instead of hardcoding:

```
Healthcare → HIPAA Reviewer
```

the Facilitator should maintain a knowledge base of domains and their associated expertise.

For example:

```
Task Classification
        │
        ▼
Knowledge Base

Healthcare
 ├── HIPAA
 ├── Privacy
 ├── Security
 └── Clinical

Finance
 ├── Risk
 ├── Audit
 ├── AML
 └── Security

Legal
 ├── Evidence
 ├── Privacy
 ├── Compliance
 └── Contracts
```

When a task is classified, the appropriate capabilities are selected automatically.

---

# A New Role: Capability Planner

One addition I'd make to the framework is separating orchestration from capability selection.

```
Human
   │
   ▼
Facilitator
   │
   ▼
Capability Planner
   │
   ▼
Team Assembly
   │
   ▼
Workflow
```

The Facilitator owns workflow state and orchestration.

The Capability Planner owns:

- domain detection,
    
- role selection,
    
- workflow templates,
    
- required artifacts,
    
- governance rules.
    

This separation keeps the Facilitator focused and allows capability selection to evolve independently.

---

## An architectural pattern

This begins to resemble modern operating systems more than traditional project management.

|Operating System|Synthetic Team|
|---|---|
|Kernel|Facilitator|
|Device detection|Task classification|
|Driver manager|Capability Planner|
|Drivers|Domain experts|
|Process scheduler|Workflow engine|
|Filesystem|Artifact store|
|System logs|Traces|
|Memory manager|Context manager|
|Security subsystem|Truth-Teller + policy engine|

The consequence is significant: instead of building one monolithic "super-agent," the system becomes a configurable cognitive platform. Each task is matched with the smallest, most appropriate organization required to solve it, which reduces unnecessary context, lowers cognitive load, and makes the framework applicable across domains without redesigning the core architecture.

---

One observation from this discussion that I think is worth elevating because it changes the direction of the framework:

> **The synthetic team should not be modeled after an organizational chart. It should be modeled after an information processing pipeline.**

That subtle shift resolves several design questions.

Instead of asking:

- Which agents should exist?
    
- Who reports to whom?
    
- Which agent starts first?
    

The questions become:

- What transformation of information is needed next?
    
- What evidence is missing?
    
- What expertise is required?
    
- What artifact should be produced?
    
- Who owns that artifact?
    
- How is the artifact evaluated before it moves downstream?
    

Viewed this way, every role has a single responsibility:

|Role|Transformation|
|---|---|
|Facilitator|Intent → Task Manifest|
|Capability Planner|Task Manifest → Team Topology|
|Analyst|Task Manifest → Requirements|
|Architect|Requirements → System Design|
|Builder|Design → Implementation|
|Reviewer|Implementation → Quality Assessment|
|Truth-Teller|Claims → Verified Evidence|
|Operator|Release → Running System|
|Evaluator|Runtime Data → Organizational Learning|

Notice that every role transforms one representation into another. This is much closer to a compiler pipeline than a project management workflow.

I also think the framework is converging on three orthogonal dimensions:

1. **Organizational topology** (influenced by _Team Topologies_) — roles, ownership, interaction modes, and capability composition.
    
2. **Information topology** — the flow and transformation of artifacts, traces, evaluations, and evidence.
    
3. **Decision topology** — how proposals are generated, challenged, selected, executed, and revisited when new evidence appears.
    

Most current multi-agent frameworks focus almost exclusively on the first. The discussions here have increasingly defined the second and third, which are what make the organization observable, auditable, and resilient.

One final principle also emerged naturally:

> **Humans should be free to think nonlinearly. The synthetic organization is responsible for converting nonlinear thought into linear execution.**

That principle may end up being one of the defining characteristics of the framework. It allows creativity to remain unconstrained while ensuring implementation remains structured, traceable, and repeatable.