# OKF Conversion Prompt

Convert a project's existing knowledge base / documentation into an **Open Knowledge Format (OKF)** bundle — a directory of self-describing, machine-readable concept files with YAML frontmatter.

OKF v0.1 is an open specification by [Google Cloud (published June 2026)](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing) for representing knowledge as portable markdown files. Every non-reserved file is a **concept** (one unit of knowledge). The format is intentionally minimal: YAML frontmatter, markdown body, directory-as-bundle.

---

## 1. What You Will Produce

An `okf/` directory at the project root with this structure:

```
okf/
  INDEX.md                — Entry point table, canonical IDs, relationships, vocabulary
  concepts/               — Foundational ideas (one concept per file)
    <concept-name>.md
  roles/                  — Bounded function definitions (if applicable)
    <role-name>.md
  artifacts/              — Produced/consumed documents (if applicable)
    <artifact-name>.md
  workflows/              — Ordered stage sequences (if applicable)
    <workflow-name>.md
  schemas/                — JSON Schema validation specs (optional)
    <name>.schema.json
  patterns/               — Reusable structures (if applicable)
    <pattern-name>.md
  examples/               — Concrete instances (if applicable)
    <example-name>/
      README.md
  reference/              — Glossary, citations, etc.
    glossary.md
```

**Production rule:** Only create directories and files that are relevant to this project's domain. If the knowledge base has no roles, omit `roles/`. If it has no workflows, omit `workflows/`.

---

## 2. Entity Types (Choose What Applies)

| Directory | Prefix | Purpose | Examples |
|-----------|--------|---------|----------|
| `concepts/` | `concept.*` | Foundational ideas, principles, definitions | trust, governance, workflow, evaluation |
| `roles/` | `role.*` | Bounded function definitions | facilitator, builder, reviewer |
| `artifacts/` | `artifact.*` | Produced/consumed documents | spec, adr, review-report |
| `workflows/` | `workflow.*` | Ordered stage sequences with gates | default, deploy |
| `schemas/` | `schema.*` | JSON Schema validation specs | role-card.schema, artifact.schema |
| `patterns/` | `pattern.*` | Reusable structures | trusted-advisor |
| `examples/` | `example.*` | Concrete instances of patterns/concepts | my-project-use-case |
| `reference/` | `reference.*` | Glossaries, external citations | glossary |

---

## 3. OKF File Format (Every Concept File)

Every concept file follows this structure:

```markdown
---
id: <prefix>.<name>       # REQUIRED — canonical, never changes
title: <string>            # REQUIRED — human-readable title
type: <entity-type>        # REQUIRED — concept | role | artifact | workflow | pattern | example | reference | schema
status: stable|draft|deprecated
version: 1.0
owner: <project-name>
tags:
  - <tag1>
  - <tag2>
depends_on:                # REQUIRED — what this entity needs to function
  - <prefix>.<name>
produces:                  # if applicable — what this entity generates
  - <prefix>.<name>
consumes:                  # if applicable — what this entity uses as input
  - <prefix>.<name>
related:                   # OPTIONAL — conceptually adjacent entities
  - <prefix>.<name>

# Type-specific fields (add as needed):
# For roles: authority, activation, responsibilities, inputs, outputs, tools, evaluates, failure_modes, weakness, handoffs
# For artifacts: producer, consumer, lifecycle, schema, validation_rules
# For workflows: entry_conditions, stages, gates, required_artifacts, exit_conditions, failure_recovery
# For patterns: problem, solution, structure
# For examples: implements, demo, uses
---

## Specification

### Definition

<structured content covering what this entity is>

<additional subsections as needed>

---

## Rationale

### Origin

<why this entity exists, design decisions, context>
```

---

## 4. Canonical ID Prefixes

ID = `{prefix}.{kebab-case-name}`. Globally unique, stable, never reassigned.

| Prefix | Entity Type |
|--------|-------------|
| `concept.*` | Foundational idea |
| `role.*` | Bounded function |
| `artifact.*` | Produced/consumed document |
| `workflow.*` | Ordered stage sequence |
| `schema.*` | Validation specification |
| `principle.*` | Invariant rule |
| `constraint.*` | Non-negotiable limit |
| `pattern.*` | Reusable structure |
| `example.*` | Concrete instance |
| `reference.*` | Glossary / citation |

---

## 5. Relationship Types

Use the most specific relationship available. Declare all relationships in YAML frontmatter.

| Relation | Direction | Meaning |
|----------|-----------|---------|
| `depends_on` | → | Requires the target to function |
| `extends` | → | Specializes the target |
| `implements` | → | Realizes the target |
| `produces` | → | Generates the target |
| `consumes` | → | Uses the target as input |
| `replaces` | → | Supersedes the target |
| `supersedes` | → | Is superseded by the target |
| `conflicts_with` | ↔ | Incompatible with the target |
| `related` | ↔ | Conceptually adjacent (weakest — prefer typed relationships) |
| `evaluates` | → | Measures/assesses the target |
| `governs` | → | Constrains the target |

**Rules:**
- No circular dependency chains (A→B→A, directly or transitively)
- Every relationship target ID must exist in the ontology
- `related` is the fallback — prefer `depends_on`, `produces`, `consumes` when applicable

---

## 6. Design Rules

1. **One concept per file.** Split multi-topic source documents into individual files.
2. **Every file has YAML frontmatter** with at minimum `id`, `title`, `type`.
3. **Every entity has a stable canonical ID.** Never reuse or reassign a retired ID.
4. **Specification precedes rationale.** Always `## Specification` first, then `## Rationale`.
5. **Terminology is normalized.** Choose one canonical term per concept and use it consistently. List deprecated terms in vocabulary.
6. **Every role has a defined weakness/failure mode.**
7. **Every artifact has a producer and consumer.**
8. **Every workflow has ordered stages and gates.**
9. **Examples are concrete, not abstract.**
10. **Original source documents remain untouched.** OKF files are a derived format.
11. **Target file size:** <100 lines preferred, <200 acceptable, >300 requires justification (likely needs splitting).
12. **Prefer explicit relationship over implicit prose.** If A depends on B, write `depends_on: [concept.b]` in A's frontmatter.

---

## 7. Conversion Process (Step by Step)

### Phase A: Inventory & Analysis

1. Read ALL files in the project's knowledge base / documentation directory.
2. Identify distinct concepts, roles, artifacts, workflows, patterns, and examples.
3. For each source document, list the entities it contains. One source document may produce many OKF files.
4. Identify canonical terms. Create a vocabulary table of preferred terms and deprecated alternatives.

### Phase B: Ontology Design

1. Classify each entity into one of the entity types (concept, role, artifact, workflow, pattern, example, reference, schema).
2. Assign a canonical ID to each entity using the prefix convention.
3. Determine relationships between entities (depends_on, produces, consumes, etc.).
4. Validate that the relationship graph has no circular dependencies.

### Phase C: File Creation

For each identified entity, create an OKF file:

1. Write the YAML frontmatter with `id`, `title`, `type`, `status`, `version`, `tags`, and relationship fields.
2. Add type-specific frontmatter fields:
   - **Role:** `authority`, `activation`, `responsibilities`, `inputs`, `outputs`, `tools`, `evaluates`, `failure_modes`, `weakness`, `handoffs`
   - **Artifact:** `producer`, `consumer`, `lifecycle`, `schema`, `validation_rules`
   - **Workflow:** `entry_conditions`, `stages`, `gates`, `required_artifacts`, `exit_conditions`, `failure_recovery`
   - **Pattern:** `problem`, `solution`, `structure`
3. Write the `## Specification` section: structured, concise definition of what the entity is.
4. Write the `## Rationale` section: why the entity exists, design decisions, context.
5. Distill content from source documents — extract the essential, omit the redundant, normalize terminology.

### Phase D: Relationship Wiring

1. After all files are created, wire relationships by updating frontmatter:
   - Set `depends_on`, `produces`, `consumes`, `related` on each entity.
   - Verify every target ID in a relationship field exists as an `id` somewhere in the ontology.
2. Ensure every artifact has at least one producer and one consumer role.
3. Ensure every role has a documented weakness/failure mode.
4. Ensure every workflow has at least 3 stages and at least one terminal gate.

### Phase E: Vocabulary Normalization

1. Scan all OKF files for deprecated terms. Replace with canonical forms.
2. Update the vocabulary table in INDEX.md.

### Phase F: INDEX.md Generation

Generate an INDEX.md at the root of the OKF bundle with:
- Ontology map header (bundle id, type, status, version, owner)
- Entry points table (Path | ID | Type) — every file in the bundle
- Canonical ID prefixes
- Relationship types table
- Vocabulary table (preferred term → deprecated terms)
- Design rules

---

## 8. Validation Checklist

Before finishing, verify:

- [ ] Every non-reserved file has parseable YAML frontmatter with non-empty `id`, `title`, `type`
- [ ] No duplicate IDs exist across the bundle
- [ ] Every relationship target ID exists in INDEX.md
- [ ] No circular dependency chains
- [ ] Every artifact has a producer and consumer
- [ ] Every role has a documented weakness/failure mode
- [ ] Every workflow has ≥3 stages and a terminal gate
- [ ] Specification precedes rationale in every file
- [ ] Terminology is normalized (no deprecated terms in prose)
- [ ] All original source documents remain untouched

---

## 9. Tooling (Optional but Recommended)

| Tool | Purpose |
|------|---------|
| `yq` | Read/write YAML frontmatter |
| `ajv-cli` | Validate frontmatter against JSON schemas |
| `ripgrep (rg)` | Search across frontmatter and prose |
| `repomix` | Bundle entire OKF dir into single file for LLM consumption |
| `yamllint` | Lint YAML formatting |
| `graphviz`/`d2` | Render relationship graphs |
| `lychee` | Check markdown links |
| `fd` | Fast file discovery |
