# Role Cards Framework

Role Cards is a control system for collaboration. It defines responsibilities as explicit roles with bounded authority and ordered interaction. The framework exists to make work more controllable and inspectable by reducing role ambiguity and preserving ownership.

---

# 1. Problem

Collaboration becomes difficult to inspect when responsibility is unclear.

Common failure patterns include:

- overlapping duties
    
- missing ownership
    
- inconsistent use of AI
    
- implicit authority
    

These conditions increase coordination costs and make decisions harder to trace.

---

# 2. Core Claim

**Collaboration becomes more controllable and inspectable when responsibilities are explicit, bounded, and activated in sequence.**

When roles are unclear, unbounded, or simultaneously authoritative, ownership becomes harder to identify and work becomes harder to audit.

---

# 3. What a Role Card Is

A Role Card is a constrained role definition that converts responsibility into a unit with defined inputs, actions, and outputs.

Each card includes:

- Name
    
- Alias
    
- Archetype
    
- Level
    
- Primary Type
    
- Secondary Type
    
- Special Ability
    
- Weakness
    
- Signature Move
    
- Team Synergy Boost
    
- XP Gain Condition
    

Every field must correspond to observable behavior.

---

# 4. Structural Constraints

The framework enforces three requirements:

### Justifiability

A role must perform a necessary function.

### Observability

A role must produce visible outputs.

### Auditability

Actions must be attributable to a role.

Roles that fail these requirements are removed.

---

# 5. Archetype Families

Role Cards are grouped into six functional archetypes.

### Analyst

Transforms inputs into validated information.

### Builder

Converts inputs into artifacts.

### Operator

Executes and maintains delivery.

### Truth-Teller

Audits outcomes and exposes reality gaps.

### Reviewer

Tests outputs and exposes weaknesses.

### Facilitator

Maintains coordination and continuity.

System dependency:

- no Analyst → unreliable inputs
    
- no Builder → no artifacts
    
- no Operator → no execution
    
- no Truth-Teller → no feedback loop
    
- no Reviewer → no quality control
    
- no Facilitator → coordination breakdown
    

---

# 6. Control Mechanisms

## Role Boundaries

- Analyst does not produce final outputs.
    
- Builder does not validate its own work.
    
- Reviewer does not create new artifacts.
    
- Operator does not redefine direction.
    
- Truth-Teller does not bypass evidence.
    
- Facilitator does not replace execution.
    

Role overlap weakens ownership.

## Weakness as Control

Weakness is an intentional limitation.

It:

- prevents role dominance
    
- creates dependency between roles
    
- signals when another role should activate
    

Unbalanced roles produce predictable failure modes.

---

# 7. Role Interaction

Roles operate through ordered handoffs rather than shared control.

```text
Analyst
↓
Builder
↓
Reviewer
↓
Operator
↓
Truth-Teller
```

The Facilitator maintains continuity and resolves conflicts.

Shared authority increases ambiguity and coordination cost.

---

# 8. Mechanism

The framework operates through:

- separation of concerns
    
- bounded authority
    
- ordered interaction
    
- traceability
    

These mechanisms reduce reliance on informal coordination and preserve ownership.

---

# 9. Solo Execution

A single person may simulate role separation by switching roles explicitly:

```text
Analyst
↓
Builder
↓
Reviewer
↓
Operator
↓
Truth-Teller
```

Combining roles without explicit switching removes visibility into who is responsible for which function.

---

# 10. Non-Claims

The framework does not:

- optimize for speed
    
- guarantee correctness
    
- replace domain expertise
    

It is a control system.

---

# 11. Core Insight

Unstructured collaboration is harder to inspect because responsibility and authority become diffuse.

Role Cards localize failure by enforcing:

- defined responsibility
    
- bounded authority
    
- ordered interaction
    

As a result, decisions remain easier to inspect and work remains easier to control.