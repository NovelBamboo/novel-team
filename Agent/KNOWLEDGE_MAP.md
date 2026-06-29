# Knowledge Map

**Purpose:** Show agents what the ontology is, where files live, how to navigate tasks, and how entities relate.

An agent should not care about file paths first. It should care about the knowledge topology.

---

# 1. Knowledge Topology

```
Synthetic Team
│
├── Role (bounded function)
│    ├── Analyst
│    ├── Builder
│    ├── Facilitator
│    ├── Operator
│    ├── Reviewer
│    └── Truth-Teller
│
├── Artifact (produced/consumed document)
│    ├── ADR
│    ├── Decision Record
│    ├── Review Report
│    ├── Runbook
│    ├── Spec
│    ├── Task Graph
│    └── Truth Report
│
├── Workflow (ordered stage sequence)
│    ├── Default
│    ├── Deliberation Cycle
│    └── ADREI (Production)
│
├── Principle (invariant rule)
│
├── Constraint (non-negotiable limit)
│
├── Concept (foundational idea)
│    ├── Activation Condition
│    ├── Adversarial
│    ├── Authority
│    ├── Deliberation
│    ├── Evaluation
│    ├── Governance
│    ├── Persona Layer
│    ├── Role Card
│    ├── Rolecard Layer
│    ├── Telemetry
│    ├── Trust
│    └── Workflow
│
├── Schema (validation spec)
│    ├── artifact.schema.json
│    ├── decision.schema.json
│    ├── evaluation.schema.json
│    ├── role-card.schema.json
│    └── workflow.schema.json
│
├── Pattern (reusable structure)
│    └── Trusted Advisor
│
└── Example (concrete instance)
     ├── Regulatory Arbitrage
     ├── Software Team
     └── Trusted Advisor
```

---

# 2. Physical Layout

```
okf/
├── INDEX.md              — Entry point table, canonical IDs, relationship types, vocabulary
├── concepts/             — Foundational ideas (15 files)
├── roles/                — Bounded function definitions (6 files)
├── artifacts/            — Produced/consumed documents (7 files)
├── workflows/            — Ordered stage sequences (3 files)
├── schemas/              — JSON Schema validation specs (5 files)
├── patterns/             — Reusable structures (1 file)
├── examples/             — Concrete instances (3 directories)
└── reference/            — Glossary (1 file)

00_Agent/
├── AGENTS.md             — Agent operating protocol
├── KNOWLEDGE_MAP.md      — This file
├── ONTOLOGY_BOUNDARIES.md — Allowed/forbidden relationship matrix
├── KNOWLEDGE_TASKS.md    — Task classification and search strategies
├── OKF_TOOLS.md          — Toolchain reference
└── OKF_COMMANDS.md       — Repeatable build/validate/export commands
```

---

# 3. Navigation

Routes for common agent tasks.

## Adding a Role

```
KNOWLEDGE_MAP → Topology: Role
         ↓
ONTOLOGY_BOUNDARIES → Allowed: Role produces Artifact, Role consumes Artifact
         ↓
role-card.schema.json → Required frontmatter fields
         ↓
Existing roles/ → Copy pattern (facilitator.md, builder.md)
         ↓
Artifacts the role produces/consumes → Verify they exist
         ↓
Workflow that uses this role → Update workflow stages
```

## Adding an Artifact

```
KNOWLEDGE_MAP → Topology: Artifact
         ↓
artifact.schema.json → Required frontmatter fields
         ↓
ONTOLOGY_BOUNDARIES → Every artifact needs a producer and consumer
         ↓
Existing artifacts/ → Copy pattern (spec.md, adr.md)
         ↓
Roles that produce/consume → Verify producer and consumer exist
         ↓
Workflow that requires this artifact → Update workflow gates
```

## Modifying a Workflow

```
KNOWLEDGE_MAP → Topology: Workflow
         ↓
workflow.schema.json → Required frontmatter fields
         ↓
Default workflow → Read current stages and gates
         ↓
Artifacts required → Verify every required artifact exists
         ↓
Roles in stages → Verify every referenced role exists
         ↓
ONTOLOGY_BOUNDARIES → Workflow requires Artifact, requires Role
```

## Adding a Concept

```
KNOWLEDGE_MAP → Topology: Concept (check for existing similar concept)
         ↓
INDEX.md → Check for ID collision
         ↓
ONTOLOGY_BOUNDARIES → Check allowed relationships
         ↓
Similar concept files → Copy frontmatter pattern
         ↓
Determine relationships → depends_on, related, conflicts_with, supersedes
```

## Changing Terminology

```
KNOWLEDGE_MAP → Vocabulary (INDEX.md canonical terms table)
         ↓
rg "deprecated-term" okf/ → Find all usages
         ↓
Update each file's frontmatter and prose
         ↓
Update INDEX.md vocabulary table
```

## Deprecating a Concept

```
KNOWLEDGE_MAP → Locate entity in topology
         ↓
INDEX.md → Find all entry points referencing this ID
         ↓
rg "concept.deprecated-id" okf/ → Find all relationship references
         ↓
Add supersedes relationship → Point to replacement concept
         ↓
Update INDEX.md → Mark status as deprecated
```

## Validating the Ontology

```
ONTOLOGY_BOUNDARIES → Cross-cutting rules
         ↓
ajv validate → Run schema validation against all files
         ↓
Link check → Verify all relationship targets exist
         ↓
INDEX consistency → Every file has an entry, every ID resolves
```

---

# 4. Canonical Relationships

Knowledge topology is static. These flows are dynamic — they show how entities interact.

## Role → Artifact Pipeline

```
Role
  │
  ├── produces ──────► Artifact
  │                        │
  │                   ┌────┴────┐
  │                   │         │
  │              consumed_by   validated_by
  │                   │         │
  │                   ▼         ▼
  │                 Role      Reviewer
  │
  ├── consumes ──────► Artifact (from another Role)
  │
  └── governs ───────► Workflow
```

## Workflow → Artifact → Role

```
Workflow
  │
  ├── requires ──────► Artifact (gate input)
  │
  ├── requires ──────► Role (performer)
  │                        │
  │                   produces Artifact (gate output)
  │
  └── governed_by ───► Principle
```

## Evaluation Chain

```
Evaluator (Role)
  │
  ├── evaluates ─────► Artifact
  │                        │
  │                   ┌────┴────┐
  │                   │         │
  │               passes        fails
  │                   │         │
  │                   ▼         ▼
  │              Workflow   Rework (Role)
  │              proceeds    produces fix
  │
  └── produces ──────► Evaluation (Artifact)
```

## Governance Chain

```
Principle
  │
  ├── governs ───────► Role
  │                        │
  │                   ┌────┴────┐
  │                   │         │
  │              constrained    failure_mode
  │                   │         │
  │                   ▼         ▼
  │               Behavior    Documented
  │               bounded     weakness
  │
  ├── governs ───────► Workflow
  │
  └── governs ───────► Artifact
                            │
                       conforms_to
                            │
                            ▼
                         Schema
```

---

# 5. Entry Points

Routing table for AI agents. Given a task type, follow this path.

| If the task is… | Start with | Then read | Finally edit |
|---|---|---|---|
| Adding a role | Role topology | role-card schema, existing roles | `okf/roles/` + update workflow |
| Adding an artifact | Artifact topology | artifact schema, existing artifacts | `okf/artifacts/` + update producer/consumer |
| Adding a workflow | Workflow topology | workflow schema, existing roles/artifacts | `okf/workflows/` |
| Adding a concept | Concept topology | similar concepts in `okf/concepts/` | `okf/concepts/` + INDEX.md |
| Modifying relationships | Relationship types table | `ONTOLOGY_BOUNDARIES.md` | Frontmatter of affected files |
| Renaming a concept | INDEX.md entry | all files referencing the ID | Every file with the old ID |
| Deprecating a concept | INDEX.md + dependents | supersedes target | Deprecate ID, update referrers |
| Changing terminology | Vocabulary table | `rg` for old term in all files | Frontmatter + prose |
| Validating schemas | Schema files | `npm run okf:validate` | Fix violations in entity files |
| Generating bundle | `npm run okf:bundle` | — | Verify output |
| Building graph | Relationship types | `npm run okf:graph` | Inspect SVG for issues |
| Adding examples | Example topology | existing example pattern | `okf/examples/` |
| Refining prose | Concept topology | exact concept file | Frontmatter + prose body |

---

# Machine-Readable Index

```yaml
ontology:
  id: synthetic-teams.okf
  version: 1.0
  status: stable

role:
  path: okf/roles/
  schema: okf/schemas/role-card.schema.json
  allowed_relationships: [produces, consumes, evaluates, governs, depends_on, extends, conflicts_with, replaces]

artifact:
  path: okf/artifacts/
  schema: okf/schemas/artifact.schema.json
  allowed_relationships: [depends_on, supersedes, conflicts_with, related]

workflow:
  path: okf/workflows/
  schema: okf/schemas/workflow.schema.json
  allowed_relationships: [requires, depends_on, implements, produces, governs]

concept:
  path: okf/concepts/
  schema: null
  allowed_relationships: [depends_on, supersedes, related, conflicts_with, implements]

schema:
  path: okf/schemas/
  allowed_relationships: [validates, extends, depends_on]

principle:
  path: okf/concepts/
  allowed_relationships: [governs, depends_on]

pattern:
  path: okf/patterns/
  allowed_relationships: [implements, depends_on, related]

example:
  path: okf/examples/
  allowed_relationships: [implements, demo, uses, produces]

boundaries:
  file: 00_Agent/ONTOLOGY_BOUNDARIES.md
  rules:
    - no_circular_dependencies
    - every_artifact_has_producer_and_consumer
    - every_role_has_failure_mode
    - every_workflow_has_three_stages_and_terminal_gate
    - every_schema_validates_at_least_one_entity
    - no_self_validation
    - no_persona_authority

tasks:
  file: 00_Agent/KNOWLEDGE_TASKS.md
  groups:
    - editorial
    - relational
    - validation
    - generative
    - exemplary
    - structural
    - deprecation

tools:
  file: 00_Agent/OKF_TOOLS.md
  core:
    - yq (frontmatter)
    - ajv (schema validation)
    - rg (search)
    - repomix (bundle)
    - graphviz (graph)

commands:
  file: 00_Agent/OKF_COMMANDS.md
  scripts:
    validate: npm run okf:validate
    bundle: npm run okf:bundle
    graph: npm run okf:graph
    index: npm run okf:index
    check_links: npm run okf:check-links
```

---

# Vocabulary (Canonical Terms)

| Preferred Term | Deprecated Terms |
|---|---|
| Facilitator | Orchestrator, Coordinator |
| Builder | Implementer, Developer, Creator |
| Reviewer | Auditor, QA, Inspector |
| Analyst | Specifier, Researcher |
| Operator | Runner, Executor |
| Truth-Teller | Reality Auditor, Verifier |
| Artifact | Deliverable, Output |
| Workflow | Pipeline, Process, SOP |
| Authority | Permission, Right, Control |
| Activation Condition | Trigger, Gate |
| Governance | Policy, Rule |
| Evaluation | Assessment, Review, Validation |

---

# Design Rules

1. Every file has exactly one concept.
2. Every concept has a stable canonical ID.
3. Every file has YAML frontmatter.
4. Every relationship is explicit (`depends_on`, `produces`, `consumes`).
5. Specification precedes rationale.
6. Terminology uses canonical forms only.
7. Every role has a defined weakness (failure mode).
8. Every artifact has a producer and consumer.
9. Every workflow has ordered stages and gates.
10. Examples are concrete, not abstract.
