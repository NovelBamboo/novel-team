Add `ROLE_MAP.md` to the OKF project.
- reference: [Knowledge/99-Role-Map](Knowledge/99-Role-Map.md)

Goal: create an organizational equivalent of `REPO_MAP.md`.

The codebase map tells agents where code lives. `ROLE_MAP.md` should tell the Facilitator which roles, capabilities, workflows, artifacts, and decision gates are required for a task.

Do not make the Facilitator infer team structure from scratch. The Facilitator should route through explicit maps.

Follow existing OKF rules:

- Read `Agent/KNOWLEDGE_MAP.md`
    
- Read `Agent/ONTOLOGY_BOUNDARIES.md`
    
- Preserve stable IDs
    
- Use canonical terminology
    
- Touch the fewest files possible
    
- Do not create new role types unless schemas are updated
    
- Prefer explicit relationships over prose
    

Create:

`okf/ROLE_MAP.md`

The file should define:

1. Purpose
    
2. Routing model
    
3. Role Map
    
4. Capability Map
    
5. Workflow Map
    
6. Artifact Map
    
7. Decision Map
    
8. Evaluation Map
    
9. Facilitator routing rules
    
10. Example task traversal
    

Core model:

```text
Intent
  ↓
Classification
  ↓
Capability Map
  ↓
Required Roles
  ↓
Workflow Selection
  ↓
Artifact Requirements
  ↓
Decision Gates
  ↓
Execution
  ↓
Evaluation
  ↓
Trace Archive
```

Key principle:

The Facilitator is a router, not a domain expert.

It should consult `ROLE_MAP.md` before assembling a synthetic team.

Add examples for:

- Feature work
    
- Bug fix
    
- Security incident
    
- Research task
    
- Database migration
    
- Authentication / passkeys
    

Use YAML-style blocks where helpful.

Include this distinction:

- Role Cards define what a role is.
    
- ROLE_MAP defines when a role is needed.
    

Include this rule:

No task may advance until required artifacts and decision gates for its capability class are satisfied.

After adding `ROLE_MAP.md`, update `okf/INDEX.md` only if the existing indexing pattern requires new top-level knowledge files to be listed.

Do not rewrite existing role files unless required for consistency.