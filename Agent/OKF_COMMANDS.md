# Generating INDEX.md

## Goal

Create a machine-readable map of every ontology file, its canonical ID, type, and relationships.

INDEX.md is the single source of truth for:
- Concept location
- Relationship validation
- Graph building
- Export bundling

Target size: exact count of ontology files + header. Never add prose description to INDEX.md entries (that goes in individual concept files).

---

# Step 1: Extract Frontmatter

```bash
# Extract IDs from all ontology files
for f in okf/concepts/*.md okf/roles/*.md okf/artifacts/*.md okf/workflows/*.md okf/patterns/*.md okf/schemas/*.json; do
  id=$(yq '.id' "$f" 2>/dev/null)
  type=$(yq '.type' "$f" 2>/dev/null)
  echo "$f | $id | $type"
done
```

---

# Step 2: Update INDEX.md

Requires:
- All files present in `okf/` directories
- No duplicate IDs
- All relationships point to existing IDs

Do not include prose, implementation details, or philosophy in INDEX.md.

---

# Step 3: Structure

```markdown
# Synthetic Teams — Open Knowledge Format

## Ontology Map

id: <bundle-id>
type: knowledge-base
status: stable
version: <semver>
owner: Synthetic Teams

## Entry Points

| Path | ID | Type |
|---|---|---|

## Canonical ID Prefixes

- `concept.*`
- `role.*`
- `artifact.*`
- ...

## Relationship Types

| Relation | Meaning |
|---|---|

## Vocabulary

| Preferred Term | Deprecated Terms |
|---|---|

## Design Rules

1. ...
```

---

# Validation

## Validate YAML Frontmatter

```bash
yamllint okf/concepts/*.md okf/roles/*.md okf/artifacts/*.md okf/workflows/*.md
```

---

## Validate Against Schemas

```bash
# Validate roles against role-card schema
ajv validate \
  -s okf/schemas/role-card.schema.json \
  -d okf/roles/*.md \
  --strict=false

# Validate artifacts against artifact schema
ajv validate \
  -s okf/schemas/artifact.schema.json \
  -d okf/artifacts/*.md \
  --strict=false

# Validate workflows against workflow schema
ajv validate \
  -s okf/schemas/workflow.schema.json \
  -d okf/workflows/*.md \
  --strict=false
```

---

## Validate INDEX Consistency

```bash
# Check all relationships reference existing IDs
rg "^[a-z]+_[a-z]+:" okf/concepts/*.md okf/roles/*.md | \
  grep -oE '[a-z]+\.[a-z-]+' | \
  while read id; do
    if ! grep -q "$id" okf/INDEX.md; then
      echo "MISSING: $id"
    fi
  done
```

---

## Validate No Circular Dependencies

```bash
# Extract all depends_on relationships
rg "depends_on:" okf/concepts/*.md okf/roles/*.md -r '$1' | \
  sed 's/:/ -> /' | sort
# Visual inspection for cycles, or pipe to Graphviz for cycle detection
```

---

# Bundle Export

## Generate Single-File Bundle

```bash
repomix okf/ --output okf-bundle.md
```

The bundle file is used for:
- LLM context injection
- Distribution to downstream consumers
- Versioned snapshots

---

## Archive Bundle

```bash
tar czf okf-bundle-$(date +%Y%m%d).tar.gz okf/
```

---

# Relationship Graph

## Build DOT Graph

```bash
# Generate relationship graph from frontmatter
echo "digraph OKF {" > okf-graph.dot
for f in okf/concepts/*.md okf/roles/*.md okf/artifacts/*.md; do
  id=$(yq '.id' "$f")
  yq '.depends_on // [] | .[]' "$f" | while read dep; do
    echo "  \"$id\" -> \"$dep\" [label=\"depends_on\"];" >> okf-graph.dot
  done
  yq '.produces // [] | .[]' "$f" | while read prod; do
    echo "  \"$id\" -> \"$prod\" [label=\"produces\"];" >> okf-graph.dot
  done
  # Repeat for consumes, governs, evaluates, conflicts_with, extends
done
echo "}" >> okf-graph.dot
```

---

## Render Graph

```bash
dot -Tsvg okf-graph.dot -o okf-graph.svg
```

Or with D2 for cleaner output:

```bash
# Convert DOT to D2 or generate D2 directly from frontmatter
d2 okf-graph.d2 okf-graph.svg
```

---

# Search Index

## Build Text Index

```bash
# Concatenate all frontmatter into a searchable index
for f in okf/concepts/*.md okf/roles/*.md okf/artifacts/*.md; do
  echo "== $f =="
  yq '.' "$f"
done > okf-index.txt
```

## Build Relationship Index

```bash
# Extract all relationship triples (source, relation, target)
for f in okf/concepts/*.md okf/roles/*.md okf/artifacts/*.md okf/workflows/*.md; do
  source_id=$(yq '.id' "$f")
  for rel in depends_on produces consumes governs evaluates conflicts_with extends supersedes implements related; do
    yq ".$rel // [] | .[]" "$f" 2>/dev/null | while read target_id; do
      echo "$source_id | $rel | $target_id"
    done
  done
done | sort > okf-relationships.txt
```

---

# Link Checking

## Check All Markdown Links

```bash
find okf -name "*.md" -exec markdown-link-check {} \;
```

## Check Relationship Targets Match Existing IDs

```bash
rg "depends_on:|produces:|consumes:|governs:|evaluates:|conflicts_with:|extends:|supersedes:|implements:" okf/ --no-filename | \
  grep -oE '[a-z]+\.[a-z-]+' | sort -u | \
  while read id; do
    if ! grep -q "$id" okf/INDEX.md; then
      echo "DEAD RELATIONSHIP: $id has no entry in INDEX.md"
    fi
  done
```

---

# Package.json Scripts

```json
{
  "scripts": {
    "okf:validate": "yamllint okf/concepts/*.md okf/roles/*.md okf/artifacts/*.md && ajv validate -s okf/schemas/role-card.schema.json -d okf/roles/*.md --strict=false && ajv validate -s okf/schemas/artifact.schema.json -d okf/artifacts/*.md --strict=false",
    "okf:validate:all": "npm run okf:validate && ajv validate -s okf/schemas/workflow.schema.json -d okf/workflows/*.md --strict=false",
    "okf:bundle": "repomix okf/ --output okf-bundle.md",
    "okf:graph": "npm run okf:graph:dot && dot -Tsvg okf-graph.dot -o okf-graph.svg",
    "okf:graph:dot": "sh scripts/build-okf-graph.sh",
    "okf:index": "sh scripts/build-okf-index.sh",
    "okf:index:relationships": "sh scripts/build-okf-relationships.sh > okf-relationships.txt",
    "okf:check-links": "lychee okf/ --markdown",
    "okf:check-ids": "rg 'depends_on:|produces:|consumes:|governs:|evaluates:' okf/ --no-filename | grep -oE '[a-z]+\\.[a-z-]+' | sort -u | while read id; do grep -q \"$id\" okf/INDEX.md || echo \"DEAD: $id\"; done"
  }
}
```

---

# Regeneration Triggers

## Regenerate INDEX.md when:
- Adding a new concept, role, artifact, workflow, pattern, or example
- Renaming a canonical ID
- Adding or removing relationship types
- Changing entity type classification

## Regenerate Graph when:
- Adding or removing relationships
- Adding new entity files
- Before architecture review

## Regenerate Bundle when:
- Any ontology content changes
- Before distribution to LLM context

## Validate when:
- Before committing any change
- After schema updates
- After bulk relationship changes

## No need to regenerate for:
- Prose-only refinements (no frontmatter changes)
- Example content updates (unless relationships change)
- Formatting-only changes
