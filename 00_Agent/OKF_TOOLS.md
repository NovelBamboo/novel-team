Recommended toolchain for an OKF workflow (AI agents and humans), ordered roughly by value.

---

# Core: Frontmatter & Metadata

### yq ⭐⭐⭐⭐⭐

YAML processor. Essential for reading/writing frontmatter.

```bash
brew install yq
```

Use for:
- extracting frontmatter fields: `yq '.id' okf/roles/facilitator.md`
- validating YAML structure
- batch metadata updates across files

---

### jq ⭐⭐⭐⭐⭐

JSON processor. Used with schema validation output and bundle operations.

```bash
brew install jq
```

Use for:
- processing validation results
- transforming INDEX.md data
- filtering relationship graphs

---

# Validation

### ajv (Another JSON Validator) ⭐⭐⭐⭐⭐

JSON Schema validator. Validates frontmatter against `okf/schemas/*.schema.json`.

```bash
npm install -g ajv-cli
```

Use for:
- validating role files: `ajv validate -s okf/schemas/role-card.schema.json -d okf/roles/*.md --strict=false`
- validating artifact files
- validating workflow files

The schemas are at `okf/schemas/`:
- `role-card.schema.json`
- `artifact.schema.json`
- `workflow.schema.json`
- `decision.schema.json`
- `evaluation.schema.json`

---

### yamllint ⭐⭐⭐⭐

Lint YAML frontmatter for formatting issues.

```bash
brew install yamllint
```

---

# Link Checking

### markdown-link-check ⭐⭐⭐⭐

Checks internal and external markdown links.

```bash
npm install -g markdown-link-check
```

Use for:
- batch link checking across all OKF files
- finding broken `depends_on` targets

---

### lychee ⭐⭐⭐⭐⭐

Fast link checker with better perf for large sets.

```bash
brew install lychee
```

---

# Graph & Relationship Tools

### Graphviz ⭐⭐⭐⭐⭐

Renders relationship graphs from DOT files.

```bash
brew install graphviz
```

Use for:
- visualizing ontology dependency graphs
- finding circular dependencies visually
- export to SVG/PNG

---

### D2 ⭐⭐⭐⭐⭐

Modern declarative diagramming. Better for relationship maps.

```bash
brew install d2
```

Use for:
- role-artifact-workflow relationship diagrams
- boundary visualizations
- export to SVG

---

### Mermaid CLI ⭐⭐⭐⭐

Markdown-friendly diagram generation.

```bash
npm install -g @mermaid-js/mermaid-cli
```

Use for:
- embedding workflow diagrams in markdown
- quick sequence diagrams

---

# Bundle & Export

### repomix ⭐⭐⭐⭐⭐

Compresses the OKF directory into a single bundle file for LLM consumption.

```bash
npm install -g repomix
```

Use for:
- `repomix okf/ --output okf-bundle.md` — single-file ontology export
- LLM context injection
- snapshot distribution

---

### tar (built-in) ⭐⭐⭐

Simple archive for versioned exports.

```bash
tar czf okf-bundle.tar.gz okf/
```

---

# Search & Index

### ripgrep (rg) ⭐⭐⭐⭐⭐

Fast text search across frontmatter and prose.

```bash
brew install ripgrep
```

Use for:
- `rg "id: concept\." okf/concepts/` — list concept IDs
- `rg "depends_on:" okf/roles/` — find all role dependencies
- `rg "conflicts_with" okf/` — find all conflict relationships

---

### fd ⭐⭐⭐⭐

Fast file discovery.

```bash
brew install fd
```

Use for:
- `fd .md okf/` — list all ontology files
- `fd schema.json okf/` — list all schemas

---

### fzf ⭐⭐⭐

Interactive filtering of file lists.

```bash
brew install fzf
```

---

# Schema Generation

### quicktype ⭐⭐⭐⭐

Generate schemas from existing examples.

```bash
npm install -g quicktype
```

---

### TypeScript (json-to-ts) ⭐⭐⭐

```bash
npm install -g json-to-ts
```

---

# Recommended OKF Stack

## Highest ROI (install these first)

1. **yq** — frontmatter reading/writing
2. **ajv-cli** — schema validation against `okf/schemas/`
3. **Graphviz** — ontology relationship visualization
4. **rg** — fast search across concepts
5. **repomix** — bundle export for LLM consumption
6. **markdown-link-check** — relationship integrity
7. **jq** — pipeline processing
8. **D2** — relationship diagrams
9. **fd** — file discovery
10. **yamllint** — frontmatter formatting

These ten cover: read → validate → search → graph → bundle. That's the full OKF production pipeline.

## Script Integration

All tools above are invoked by the commands in `OKF_COMMANDS.md`. The `package.json` scripts wire them together:

```bash
npm run okf:validate     # yamllint + ajv validation
npm run okf:bundle       # repomix export
npm run okf:graph        # relationship graph generation
npm run okf:index        # INDEX.md regeneration
npm run okf:check-links  # lychee or markdown-link-check
```
