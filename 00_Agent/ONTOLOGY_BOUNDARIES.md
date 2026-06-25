# Purpose

Defines allowed and forbidden relationships in the Synthetic Teams OKF ontology.

This file is about **relationship rules**. For the map of content, vocabulary, and canonical ID prefixes, see `okf/INDEX.md`. For structural validation rules, see schemas in `okf/schemas/`.

Used by:
- AI agents (any)
- Human editors
- Validation scripts (`npm run okf:validate`)
- Graph builders (`npm run okf:graph`)

---

# Entity Types

| Type | Description | Directory |
|------|-------------|-----------|
| Role | Bounded function definition | `okf/roles/` |
| Artifact | Produced/consumed document | `okf/artifacts/` |
| Concept | Foundational idea | `okf/concepts/` |
| Workflow | Ordered stage sequence | `okf/workflows/` |
| Principle | Invariant rule | `okf/concepts/` (type tag) |
| Persona | User-facing description of a role | `okf/concepts/` (type tag) |
| Schema | Validation specification | `okf/schemas/` |
| Pattern | Reusable structure | `okf/patterns/` |
| Example | Concrete instance | `okf/examples/` |

---

# Relationship Types (from INDEX.md)

| Relation | Meaning |
|----------|---------|
| `depends_on` | Requires the target to function |
| `extends` | Specializes the target |
| `implements` | Realizes the target |
| `produces` | Generates the target |
| `consumes` | Uses the target as input |
| `replaces` | Supersedes the target |
| `supersedes` | Is superseded by the target |
| `conflicts_with` | Incompatible with the target |
| `related` | Conceptually adjacent |
| `evaluates` | Measures/assesses the target |
| `governs` | Constrains the target |

---

# Allowed Relationships (Matrix)

Source → Target pairs. Only these are valid.

## Role

| Relationship | Target | Notes |
|---|---|---|
| `produces` | Artifact | Primary function |
| `consumes` | Artifact | Input to function |
| `evaluates` | Artifact | Review/assessment |
| `governs` | Workflow | Defines workflow rules |
| `governs` | Principle | Owns a principle |
| `depends_on` | Concept | Needs concept to function |
| `depends_on` | Schema | Structured by a schema |
| `extends` | Role | Specialization |
| `conflicts_with` | Role | Separation of duty |
| `replaces` | Role | Deprecation path |

## Artifact

| Relationship | Target | Notes |
|---|---|---|
| `depends_on` | Concept | Grounded in a concept |
| `depends_on` | Schema | Conforms to a schema |
| `depends_on` | Artifact | References another artifact |
| `supersedes` | Artifact | Version/revision chain |
| `conflicts_with` | Artifact | Mutual exclusion |
| `related` | Artifact | Adjacent concern |

## Concept

| Relationship | Target | Notes |
|---|---|---|
| `depends_on` | Concept | Foundation relation |
| `supersedes` | Concept | Concept evolution |
| `related` | Concept | Conceptual adjacency |
| `conflicts_with` | Concept | Definitional opposition |
| `implements` | Principle | Concrete application |

## Workflow

| Relationship | Target | Notes |
|---|---|---|
| `requires` | Artifact | Input/output gate |
| `requires` | Role | Performer/approver |
| `depends_on` | Workflow | Stage ordering |
| `implements` | Pattern | Pattern instantiation |
| `produces` | Artifact | Workflow output |
| `governs` | Role | Role constraints in workflow |

## Principle

| Relationship | Target | Notes |
|---|---|---|
| `governs` | Role | Role-level constraint |
| `governs` | Workflow | Workflow-level constraint |
| `governs` | Artifact | Artifact-level constraint |
| `depends_on` | Concept | Grounded in a concept |
| `depends_on` | Principle | Composition of principles |

## Persona

| Relationship | Target | Notes |
|---|---|---|
| `describes` | Role | User-facing description |
| `depends_on` | Concept | Uses concepts to describe |
| `related` | Persona | Adjacent persona |

## Schema

| Relationship | Target | Notes |
|---|---|---|
| `validates` | Artifact | Structural rule for artifact |
| `validates` | Role | Structural rule for role card |
| `validates` | Workflow | Structural rule for workflow |
| `extends` | Schema | Schema inheritance |
| `depends_on` | Concept | Schema is about a concept |

## Pattern

| Relationship | Target | Notes |
|---|---|---|
| `implements` | Principle | Pattern makes principle concrete |
| `depends_on` | Concept | Uses concepts |
| `depends_on` | Role | Involves roles |
| `depends_on` | Artifact | Uses/produces artifacts |
| `related` | Pattern | Adjacent pattern |

## Example

| Relationship | Target | Notes |
|---|---|---|
| `implements` | Pattern | Demonstrates a pattern |
| `demo` | Concept | Illustrates a concept |
| `demo` | Workflow | Shows a workflow in action |
| `uses` | Role | Casts roles in scenario |
| `produces` | Artifact | Example outputs |

---

# Forbidden Relationships

These are never allowed:

| Source | Relationship | Target | Reason |
|--------|-------------|--------|--------|
| Role | `owns` | Role | No hierarchy ownership |
| Persona | `overrides` | RoleCard | Persona describes, does not define |
| Artifact | `validates` | itself | No self-validation |
| Schema | `validates` | itself | No self-validation |
| Role | `approves` | self (same ID) | No self-approval |
| Persona | `defines` | Authority | Authority must come from role definition |
| Example | `defines` | Schema | Examples cannot set rules |
| Any | (circular) | Any | No circular dependency chains |
| Any | `depends_on` | non-existent ID | Every target ID must exist in INDEX.md |

---

# Cross-Cutting Rules

1. **Every relationship must link to an existing canonical ID** listed in `okf/INDEX.md`.
2. **No circular dependency chains** — if A depends_on B, B must not depend_on A (directly or transitively).
3. **Every artifact must have at least one producer and one consumer** role, directly or via workflow.
4. **Every role must have exactly one failure mode** documented in its frontmatter.
5. **Every workflow must have at least 3 stages** and exactly one terminal gate.
6. **Every schema must validate at least one entity type** (artifact, role, or workflow).
7. **Example files may not define new relationships** — they instantiate existing ones.
8. **Persona files may not define authority** — authority is established by role definitions and principles.
9. **`related` is the weakest relationship** — prefer a typed relationship (`depends_on`, `produces`, `consumes`, `governs`) when one exists.
10. **Breaking a boundary rule requires a schema update first**, then a principle exception, then the change.

---

# Dangerous Areas

| Area | Risk | Protocol |
|------|------|----------|
| Creating new role types | Breaks schema, workflow assumptions | Must update `role-card.schema.json` first |
| Renaming a canonical ID | Orphans all relationship references | Requires INDEX.md + all referrers update |
| Deleting a concept | Breaks dependents | Must deprecate via `supersedes` or `replaces` first |
| Changing a relationship type | May invalidate graph traversal | Verify with `npm run okf:validate` |
| Editing a schema | Invalidates existing files | Run full validation on all entity files after |
| Cross-domain shortcut | Bypasses ontology boundaries | Never allowed — use explicit relationship path |
