Almost every ontology task falls into a few categories. Each category benefits differently from the INDEX.md and ontology search.

| Type | INDEX.md | Frontmatter Search | Prose Read |
|------|----------|-------------------|------------|
| Add concept | Yes | Small | Small |
| Split concept | Critical | Moderate | Moderate |
| Deprecate concept | Critical | Small | Small |
| Rename concept | Critical | Large | Moderate |
| Add relationship | Yes | Small | None |
| Remove relationship | Yes | Small | None |
| Validate schema | Small | None | None |
| Generate bundle | Small | None | None |
| Build relationship graph | Small | None | None |
| Update examples | Helpful | Moderate | Moderate |
| Refine prose | Helpful | Small | Moderate |

---

# Broader Task Groups

| Group | Purpose | Examples | Core Question |
|-------|---------|----------|---------------|
| **1. Editorial** | Add, change, or remove concepts | Add concept<br>Split concept<br>Deprecate concept<br>Rename concept | **What should the ontology say?** |
| **2. Relational** | Add or change connections | Add relationship<br>Remove relationship<br>Change relationship type | **How should concepts relate?** |
| **3. Validation** | Check correctness and completeness | Validate schema<br>Check links<br>Verify INDEX consistency | **Is the ontology valid?** |
| **4. Generative** | Produce artifacts from the ontology | Generate bundle<br>Build graph<br>Build search index | **What should we produce?** |
| **5. Exemplary** | Make concepts concrete | Update examples<br>Add example<br>Align example with schema | **How do we show this works?** |
| **6. Structural** | Reorganize the ontology | Split concept<br>Merge concepts<br>Reclassify entity type | **How should this be organized?** |
| **7. Deprecation** | Retire concepts safely | Deprecate concept<br>Supersede relationship<br>Archive example | **What should we remove?** |

---

# AI Agent View

Most token usage comes from three categories:

1. **Editorial** — adding/splitting/renaming concepts (requires INDEX.md + relationship analysis)
2. **Validation** — running schemas and link checks against existing content
3. **Structural** — reorganizing without breaking existing relationships

---

# Search Requirements by Task Class

## Add Concept

```text
INDEX.md ↓
check for ID collision ↓
ONTOLOGY_BOUNDARIES.md ↓
check allowed relationships ↓
find similar concept → copy pattern ↓
create file with frontmatter
```

---

## Split Concept

```text
INDEX.md ↓
identify all dependents ↓
deprecate old ID (supersedes) ↓
create two new concept files ↓
update all referrers ↓
regenerate INDEX.md
```

---

## Deprecate Concept

```text
INDEX.md ↓
find all relationships ↓
verify no active dependents ↓
add supersedes to replacement ↓
update INDEX.md status
```

---

## Validate Schema

```text
run ajv against schemas ↓
fix violations ↓
re-validate
```

---

## Generate Bundle

```text
repomix okf/ ↓
output → okf-bundle.md
```

---

# Scope Expansion

```text
Local
Add relationship / Refine prose

Domain
Add concept / Update example

Cross-Domain
Split concept / Rename concept

System
Schema change / Entity type change
```

Scope grows at each step. Stay at the smallest possible scope.

---

# Default Biases (Ontology Edition)

Prefer:

- Existing relationship type > New relationship type
- Existing stable ID > New ID
- Frontmatter change > Prose change
- Deprecation > Deletion
- Supersedes chain > Orphaned concept
- Schema validation > Manual inspection
- Small diff > Large diff
- Explicit relationship > Implicit understanding
- Concrete example > Abstract definition

---

# Modification Checklist

Before changing any ontology file:

1. Why does this concept exist?
2. Is there already a relationship that expresses this?
3. Can a relationship change replace a prose change?
4. Does this affect any schemas?
5. Does this affect any examples?
6. What is the smallest change?

---

# When Unsure

Stop.

Search INDEX.md for an existing concept.

Check BOUNDARIES.md for the allowed relationship.

Find a similar pattern in the existing ontology.

Make the smallest reasonable change.
