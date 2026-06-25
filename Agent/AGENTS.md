## MANDATORY: Use td for Task Management

Run td usage --new-session at conversation start (or after /clear). This tells you what to work on next.

Sessions are automatic (based on terminal/agent context). Optional:
- td session "name" to label the current session
- td session --new to force a new session in the same context

Use td usage -q after first read.

---

# Start Here

Before making changes:

1. Read `KNOWLEDGE_MAP.md` first — understand the ontology topology, physical layout, and navigation.
2. Read `ONTOLOGY_BOUNDARIES.md` — know what relationships are allowed.
3. Read `KNOWLEDGE_TASKS.md` — classify your task scope.
4. Query concept frontmatter (IDs, relationships) before opening prose.
5. Never infer a relationship if `depends_on`, `produces`, or `consumes` metadata already exists.
6. Do not create new role types, artifact types, or entity types without updating schemas.
7. Touch the fewest files possible.
8. Preserve existing ontology structure and stable IDs.

---

# Core Principles

- One concept per file.
- Stable canonical IDs. Never reuse or reassign a retired ID.
- YAML frontmatter on every ontology file.
- Explicit relationships before prose explanation.
- Specification precedes rationale.
- Terminology uses canonical forms only (see `KNOWLEDGE_MAP.md` vocabulary section).
- Every role has a documented weakness/failure mode.
- Every artifact has a producer and consumer role.
- Every workflow has ordered stages and explicit gates.
- Examples are concrete, not abstract.
- Schemas define valid structure; prose explains intention.

---

# Search Strategy

Order of operations:

1. `KNOWLEDGE_MAP.md` — understand the topology and find the entity path.
2. `ONTOLOGY_BOUNDARIES.md` — verify the relationship is allowed.
3. `grep` for canonical IDs in frontmatter (`rg "id: concept\." concepts/`).
4. Open exact files.
5. Read frontmatter first, prose second.

Never broad-search prose until you've exhausted frontmatter and index queries.

---

# File Size

Targets:

- <100 lines preferred
- <200 acceptable
- >300 requires justification

Split concepts, not files. A concept needing 300+ prose lines is probably two concepts.

---

# Modification Checklist

Before changing a concept file:

1. Does this ID already exist? (check `KNOWLEDGE_MAP.md` machine-readable section)
2. Is the new relationship in the allowed matrix? (check `ONTOLOGY_BOUNDARIES.md`)
3. Can a relationship change replace a prose change?
4. Does this affect any schemas in `okf/schemas/`?
5. Does this affect any existing examples in `okf/examples/`?
6. Does this introduce ambiguity with another concept?
7. Does this require a KNOWLEDGE_MAP.md update?

---

# Default Biases

Prefer:
Delete > Add
Explicit relationship > Implicit prose
Existing stable ID > New ID
Local change > Global rename
Stability > Novelty
Schema validation > Manual review

---

# Token Efficiency

Structure → Frontmatter → Relationship metadata → Prose → Edit

Never:
Whole ontology → Guess → Open dozens of files → Edit
