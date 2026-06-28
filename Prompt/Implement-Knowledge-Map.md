Add repo map to `Agent/` **REPO_MAP.md, the is the most valuable idea**.

Rename it to something like:

- `KNOWLEDGE_MAP.md`

Update AGENTS.md to start with `KNOWLEDGE_MAP.md`

---

## Why?

`REPO_MAP.md` answers:

> Where is the file?

An OKF map should answer:

> Where is the knowledge?

Those are related, but not the same.

For example, an agent shouldn't care that the Builder role lives in `roles/builder.md`.

It should care that:

```text
Builder

is_a → Role

produces → Commit

produces → Tests

consumes → Specification

validated_by → Reviewer

constrained_by → Principle.SingleResponsibility
```

The file location is secondary.

---

## Split the map into four sections.

### 1. Knowledge Topology

```text
Core Concepts

Synthetic Team
│
├── Role
│    ├── Analyst
│    ├── Builder
│    ├── Reviewer
│    ├── Operator
│    └── Facilitator
│
├── Artifact
│
├── Workflow
│
├── Principle
│
├── Constraint
│
└── Evaluation
```

An agent immediately understands the ontology.

---

### 2. Physical Layout

Equivalent to today's REPO_MAP.

```text
roles/
artifacts/
workflows/
principles/
schemas/
examples/
reference/
```

Useful.

But not the first thing.

---

### 3. Navigation

Exactly like your Search Strategy.

For example:

Need to add a role?

```text
ONTOLOGY_MAP

↓

Role Schema

↓

Existing Roles

↓

Examples
```

Need to modify a workflow?

```text
ONTOLOGY_MAP

↓

Workflow Schema

↓

Workflow

↓

Artifacts

↓

Roles
```

This is excellent because it dramatically reduces search.

---

### 4. Canonical Relationships

This is the part most repositories don't have.

```text
Role

↓

produces

↓

Artifact

↓

validated_by

↓

Reviewer

↓

required_by

↓

Workflow

↓

evaluated_by

↓

Evaluation
```

This tells an agent how the entire system fits together.

---

# Even better…

I'd make the map machine-readable.

Instead of only prose:

```yaml
ontology:

role:
path: roles/

artifact:
path: artifacts/

workflow:
path: workflows/

principle:
path: principles/

constraint:
path: constraints/

schema:
path: schemas/

example:
path: examples/
```

Now humans and agents both benefit.

---

# I would also add "entry points"

One thing I think your REPO_MAP is missing is a section like this:

```text
If the task is...

Adding a role

↓

Role Schema

↓

Role Template

↓

Existing Roles

------------------

Adding an artifact

↓

Artifact Schema

↓

Artifact Template

↓

Workflow

------------------

Changing terminology

↓

Vocabulary

↓

Ontology

↓

Affected Concepts

------------------

Adding a workflow

↓

Workflow Schema

↓

Roles

↓

Artifacts

↓

Evaluation
```

This is effectively a routing table for AI agents.

---

# One thing I'd remove

I'd eliminate almost all references to folders like:

```text
performance/

feedback/

publication/
```

unless they are part of the ontology.

Why?

Because the map should describe **how the knowledge system is organized**, not every directory in Git.

For example:

```
metadata/headlines/
```

is important in a writing repository because it's part of the editorial workflow.

But in Synthetic Teams,

```
examples/
```

is just an implementation detail.

The ontology should say

```
Example

illustrates

Concept
```

not

```
examples/
contains
files
```

---

## Overall

I think you're converging on something that's actually broader than OKF.

OKF standardizes the **bundle format**.

Your collection of files—`AGENTS.md`, `BOUNDARIES.md`, `REPO_MAP.md`, `VOCABULARY.md`, task guides, schemas, and command files—is standardizing **how an AI should navigate, reason about, and safely modify a knowledge system**.

That's a higher-level concern than OKF itself.

If I were formalizing it, I'd think of it as a **Knowledge Repository Operating System (KROS)**:

- **OKF** defines the portable knowledge objects.
    
- **KROS** defines how AI agents discover, navigate, validate, modify, and regenerate those objects safely.
    

OKF gives agents a common language. KROS gives agents a common operating procedure. Those two ideas complement each other rather than competing.

