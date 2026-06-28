# OKF INDEX.md Generation Prompt

Generate or update the `INDEX.md` file for an Open Knowledge Format (OKF) bundle. INDEX.md is the entry point and routing table for the entire ontology — it tells humans and AI agents what exists, where to find it, and how entities relate.

Run this prompt after creating all OKF concept files to produce a complete, consistent INDEX.md.

---

## 1. What INDEX.md Contains

```
okf/INDEX.md
├── Ontology Map          — Bundle metadata (id, type, status, version, owner)
├── Entry Points          — Every file in the bundle (Path | ID | Type)
├── Canonical ID Prefixes — Prefix definitions
├── Relationship Types    — Table of relationships with meanings
├── Vocabulary            — Preferred terms and deprecated alternatives
└── Design Rules          — Invariant rules for the ontology
```

---

## 2. Process

1. Scan every `.md` file in `okf/` (recursively through all subdirectories) to extract:
   - File path (relative to `okf/`)
   - Frontmatter `id` field
   - Frontmatter `type` field
2. Collect all unique canonical ID prefixes used across the bundle.
3. Collect all unique relationship types used across all frontmatter.
4. Gather the vocabulary table (canonical terms and their deprecated alternatives) from the project's knowledge.
5. Define design rules that apply to this ontology.

---

## 3. Output Format

```markdown
# <Project Name> — Open Knowledge Format

## Ontology Map

```
id: <project>.okf
type: knowledge-base
status: stable
version: 1.0
owner: <Project Name>
```

This directory is an OKF-compliant knowledge base. Every file is a single concept with YAML frontmatter, canonical ID, explicit relationships, and validation-ready metadata.

## Entry Points

| Path | ID | Type |
|---|---|---|
| concepts/<name>.md | concept.<name> | concept |
| roles/<name>.md | role.<name> | role |
| artifacts/<name>.md | artifact.<name> | artifact |
| workflows/<name>.md | workflow.<name> | workflow |
| schemas/<name>.schema.json | schema.<name> | schema |
| patterns/<name>.md | pattern.<name> | pattern |
| examples/<name>/README.md | example.<name> | example |
| reference/glossary.md | reference.glossary | reference |

## Canonical ID Prefixes

- `concept.*` — foundational ideas
- `role.*` — bounded function definitions
- `artifact.*` — produced/consumed documents
- `workflow.*` — ordered stage sequences
- `schema.*` — validation specifications
- `principle.*` — invariant rules
- `constraint.*` — non-negotiable limits
- `pattern.*` — reusable structures
- `example.*` — concrete instances
- `reference.*` — glossaries and citations

## Relationship Types

| Relation | Meaning |
|---|---|
| `depends_on` | This entity requires the target to function |
| `extends` | This entity specializes the target |
| `implements` | This entity realizes the target |
| `produces` | This entity generates the target |
| `consumes` | This entity uses the target as input |
| `replaces` | This entity supersedes the target |
| `supersedes` | This entity is superseded by the target |
| `conflicts_with` | This entity is incompatible with the target |
| `related` | This entity is conceptually adjacent |
| `evaluates` | This entity measures/assesses the target |
| `governs` | This entity constrains the target |

## Vocabulary (Canonical Terms)

| Preferred Term | Deprecated Terms |
|---|---|
| <canonical> | <deprecated synonyms> |

## Design Rules

1. Every file has exactly one concept
2. Every concept has a stable canonical ID
3. Every file has YAML frontmatter
4. Every relationship is explicit (`depends_on`, `produces`, `consumes`)
5. Specification precedes rationale
6. Terminology uses canonical forms only
7. Every role has a defined weakness (failure mode)
8. Every artifact has a producer and consumer
9. Every workflow has ordered stages and gates
10. Examples are concrete, not abstract
```

---

## 4. Validation Rules

- Every entry in the Entry Points table must correspond to an existing file on disk
- Every ID listed in any frontmatter relationship field must appear in INDEX.md
- No duplicate IDs in the Entry Points table
- All paths must use forward slashes and be relative to `okf/`
- Entry Points must be grouped by type (concepts first, then roles, artifacts, workflows, schemas, patterns, examples, reference)
