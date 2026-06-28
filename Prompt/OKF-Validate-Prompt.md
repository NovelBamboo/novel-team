# OKF Validation Prompt

Validate an Open Knowledge Format (OKF) bundle for structural integrity, relationship consistency, and format compliance. Run this prompt after conversion or after any modification to the OKF bundle.

---

## 1. Frontmatter Validation

Check every `.md` file in `okf/` (recursively, excluding `INDEX.md` and `log.md`):

- [ ] File has parseable YAML frontmatter delimited by `---`
- [ ] Frontmatter contains `id` field (non-empty string)
- [ ] Frontmatter contains `title` field (non-empty string)
- [ ] Frontmatter contains `type` field with a valid value from: `concept`, `role`, `artifact`, `workflow`, `pattern`, `example`, `reference`, `schema`
- [ ] Frontmatter contains `status` field if present is one of: `stable`, `draft`, `deprecated`
- [ ] `id` follows the pattern `{prefix}.{kebab-case-name}` where prefix is from the canonical set
- [ ] All frontmatter relationship fields (`depends_on`, `produces`, `consumes`, `related`, `extends`, `implements`, `replaces`, `supersedes`, `conflicts_with`, `evaluates`, `governs`) contain lists of valid target IDs
- [ ] No duplicate frontmatter keys

---

## 2. ID Integrity

- [ ] Every `id` value is unique across the entire bundle (no two files share the same ID)
- [ ] Every ID referenced in any relationship field exists as an `id` somewhere in the bundle
- [ ] No ID contains spaces, uppercase, or special characters (only lowercase letters, digits, hyphens, and dots)
- [ ] ID prefix matches the parent directory / entity type convention:

| Directory | Expected Prefix |
|-----------|----------------|
| `concepts/` | `concept.*` |
| `roles/` | `role.*` |
| `artifacts/` | `artifact.*` |
| `workflows/` | `workflow.*` |
| `schemas/` | `schema.*` |
| `patterns/` | `pattern.*` |
| `examples/` | `example.*` |
| `reference/` | `reference.*` |

---

## 3. Relationship Graph

- [ ] No circular dependency chains (A → B → A, directly or transitively)
- [ ] Every artifact has at least one producer role (in `produces` field of a role or in frontmatter)
- [ ] Every artifact has at least one consumer role (in `consumes` field of a role or in frontmatter)
- [ ] Every role has exactly one weakness/failure mode documented
- [ ] Every workflow has at least 3 stages
- [ ] Every workflow has at least one terminal gate
- [ ] Every relationship is semantically valid (e.g., a concept does not `consumes` a role; a workflow does not `evaluates` an artifact unless designed that way)

---

## 4. Content Structure

- [ ] Every file has a `## Specification` section before `## Rationale`
- [ ] If `## Rationale` exists, it follows `## Specification` (never precedes it)
- [ ] Role files have `authority`, `activation`, `responsibilities`, `failure_modes`, and `weakness` frontmatter fields
- [ ] Artifact files have `producer`, `consumer`, and `lifecycle` frontmatter fields
- [ ] Workflow files have `entry_conditions`, `stages`, `gates`, `required_artifacts`, and `exit_conditions` frontmatter fields

---

## 5. INDEX.md Consistency

- [ ] Every file in the bundle has an entry in INDEX.md's Entry Points table
- [ ] Every ID in INDEX.md's Entry Points corresponds to an existing file on disk
- [ ] INDEX.md contains: Ontology Map, Entry Points, Canonical ID Prefixes, Relationship Types, Vocabulary, Design Rules
- [ ] Vocabulary table lists all canonical terms used in the bundle with their deprecated alternatives
- [ ] Design rules are complete and match the project's conventions

---

## 6. Naming & Formatting

- [ ] File names use kebab-case (e.g., `synthetic-teams.md`, not `Synthetic Teams.md`)
- [ ] File names match their `id` suffix (e.g., `id: concept.synthetic-teams` → file is `concepts/synthetic-teams.md`)
- [ ] All cross-references use canonical IDs, not titles or filenames
- [ ] No files exist in `okf/` that are not listed in INDEX.md (orphan files)

---

## 7. Repair Actions

For each issue found, apply the appropriate fix:

| Issue | Fix |
|-------|-----|
| Missing `id` | Derive from file path + type prefix |
| Missing `title` | Derive from file name (kebab → Title Case) |
| Invalid relationship target | Fix ID to match existing entity or create missing entity |
| Circular dependency | Remove or redirect the offending relationship |
| Wrong section order | Move `## Rationale` after `## Specification` |
| No producer/consumer on artifact | Identify producing and consuming roles and add frontmatter |
| No weakness on role | Document the role's intentional limitation |
| Orphan file (no INDEX.md entry) | Add entry to INDEX.md or remove file |
| INDEX.md entry missing file on disk | Remove entry or create missing file |
| Deprecated term in prose | Replace with canonical term |
