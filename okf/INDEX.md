# Synthetic Teams — Open Knowledge Format

## Ontology Map

```
id: synthetic-teams.okf
type: knowledge-base
status: stable
version: 1.0
owner: Synthetic Teams
```

This directory is an OKF-compliant knowledge base. Every file is a single concept with YAML frontmatter, canonical ID, explicit relationships, and validation-ready metadata.

## Entry Points

| Path | ID | Type |
|---|---|---|
| concepts/activation-condition.md | concept.activation-condition | concept |
| concepts/adversarial.md | concept.adversarial | concept |
| concepts/artifact.md | concept.artifact | concept |
| concepts/authority.md | concept.authority | concept |
| concepts/decision-record.md | concept.decision-record | concept |
| concepts/evaluation.md | concept.evaluation | concept |
| concepts/governance.md | concept.governance | concept |
| concepts/persona-layer.md | concept.persona-layer | concept |
| concepts/role-card.md | concept.role-card | concept |
| concepts/rolecard-layer.md | concept.rolecard-layer | concept |
| concepts/synthetic-teams.md | concept.synthetic-teams | concept |
| concepts/telemetry.md | concept.telemetry | concept |
| concepts/trust.md | concept.trust | concept |
| concepts/workflow.md | concept.workflow | concept |
| concepts/cognitive-load.md | concept.cognitive-load | concept |
| concepts/team-api.md | concept.team-api | concept |
| concepts/team-topology.md | concept.team-topology | concept |
| concepts/organizational-memory.md | concept.organizational-memory | concept |
| concepts/dynamic-topology.md | concept.dynamic-topology | concept |
| concepts/epistemic-topology.md | concept.epistemic-topology | concept |
| concepts/deliberation.md | concept.deliberation | concept |
| roles/facilitator.md | role.facilitator | role |
| roles/builder.md | role.builder | role |
| roles/reviewer.md | role.reviewer | role |
| roles/analyst.md | role.analyst | role |
| roles/operator.md | role.operator | role |
| roles/truth-teller.md | role.truth-teller | role |
| roles/capability-planner.md | role.capability-planner | role |
| artifacts/task-manifest.md | artifact.task-manifest | artifact |
| artifacts/spec.md | artifact.spec | artifact |
| artifacts/adr.md | artifact.adr | artifact |
| artifacts/review-report.md | artifact.review-report | artifact |
| artifacts/truth-report.md | artifact.truth-report | artifact |
| artifacts/decision-record.md | artifact.decision-record | artifact |
| artifacts/task-graph.md | artifact.task-graph | artifact |
| artifacts/runbook.md | artifact.runbook | artifact |
| workflows/default.md | workflow.default | workflow |
| workflows/deliberation.md | workflow.deliberation | workflow |
| workflows/adrei.md | workflow.adrei | workflow |
| examples/trusted-advisor/README.md | example.trusted-advisor | example |
| examples/regulatory-arbitrage/README.md | example.regulatory-arbitrage | example |
| examples/software-team/README.md | example.software-team | example |
| patterns/trusted-advisor.md | pattern.trusted-advisor | pattern |
| patterns/stream-aligned-team.md | pattern.stream-aligned-team | pattern |
| patterns/platform-team.md | pattern.platform-team | pattern |
| patterns/enabling-team.md | pattern.enabling-team | pattern |
| patterns/specialist-team.md | pattern.specialist-team | pattern |
| reference/glossary.md | reference.glossary | reference |
| schemas/role-card.schema.json | schema.role-card | schema |
| schemas/artifact.schema.json | schema.artifact | schema |
| schemas/workflow.schema.json | schema.workflow | schema |
| schemas/decision.schema.json | schema.decision | schema |
| schemas/evaluation.schema.json | schema.evaluation | schema |

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
| Facilitator | Orchestrator, Coordinator |
| Builder | Implementer, Developer, Creator |
| Reviewer | Auditor, QA, Inspector |
| Analyst | Specifier, Researcher |
| Operator | Runner, Executor |
| Truth-Teller | Reality Auditor, Verifier |
| Artifact | Deliverable, Output |
| Workflow | Pipeline, Process, SOP |
| Authority | Permission, Right, Control |
| Activation Condition | Trigger, Gate |
| Governance | Policy, Rule |
| Evaluation | Assessment, Review, Validation |

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
