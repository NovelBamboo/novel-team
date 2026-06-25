# Role Card Schema

Role Card Schema separates presentation from execution.

The system contains two layers:

- **Persona Layer** → optional narrative wrapper for recall and usability.
    
- **RoleCard Layer** → authoritative execution model.
    

If the two layers conflict, the RoleCard layer wins.

---

# 1. Schema

```typescript
RoleCardTemplate {

  // Persona Layer (optional)

  persona?: {
    displayName: string
    personality?: string
    background?: string
    image?: string

    mission: string

    responsibilities: string[]
    deliverables: string[]

    weakness: string
  }

  // RoleCard Layer (authoritative)

  roleCard: {

    name: string
    alias: string

    archetypeFamily:
      Analyst |
      Builder |
      Operator |
      Truth-Teller |
      Reviewer |
      Facilitator

    level:
      Beginner |
      Pro |
      Legendary

    primaryType: string
    secondaryType?: string

    operationalQuestion: string

    activationCondition: string

    authority: string

    signatureMove: string

    artifactProduced: string[]

    specialAbility?: string

    weakness: string

    synergyBoost?: string

    xpGainCondition?: string

    skillRatings?: {
      [dimension: string]: 0-7
    }

    raci?: {

      accountable: string[]

      responsible: string[]

      consulted: string[]

      informed: string[]
    }

    metadata?: {

      system: string

      version: string

      year: number
    }
  }
}
```

---

# 2. Layer Separation Rules

## Persona Layer

Purpose:

- recall
    
- usability
    
- human readability
    

Constraints:

- optional
    
- descriptive only
    
- cannot define authority
    
- cannot override RoleCard behavior
    

Persona failure does not invalidate the card.

---

## RoleCard Layer

Purpose:

- execution
    
- authority
    
- evaluation
    

Constraints:

- mandatory
    
- operational
    
- observable
    
- authoritative
    

RoleCard failure invalidates the card.

---

# 3. Field Definitions

## Persona Layer

### mission

Defines intent.

Must align with the operational question.

---

### responsibilities

Repeatable actions.

Every responsibility should contribute to a produced artifact.

---

### deliverables

Concrete outputs visible to others.

---

### weakness

Human-facing description of failure tendency.

Must correspond to operational weakness.

---

## RoleCard Layer

### operationalQuestion

Primary question the role exists to answer.

---

### activationCondition

Defines when the role becomes active.

Prevents premature execution.

---

### authority

Defines what decisions the role controls.

Authority must be bounded.

---

### signatureMove

Highest-value repeatable action.

---

### artifactProduced

Observable outputs.

Artifacts are mandatory.

No artifact means no role.

---

### specialAbility

Optional capability.

Cannot violate role boundaries.

---

### weakness

Intentional limitation.

Creates dependency on other roles.

---

### synergyBoost

Defines which role is strengthened and how.

---

### xpGainCondition

Describes the what other role / strengths would improved current role / strengths when combined.

---

# 4. Consistency Constraints

A valid card must satisfy four conditions.

## Cross-Layer Alignment

- mission aligns with operationalQuestion
    
- responsibilities support signatureMove
    
- deliverables correspond to artifacts
    

---

## No Role Drift

Persona introduces no capabilities.

RoleCard defines authority.

---

## Observable Outputs

Every responsibility contributes to a traceable artifact.

---

## Failure Visibility

Weakness produces predictable failure modes.

---

# 5. Minimal Template

```json
{
  "persona": {

    "displayName": "",

    "mission": "",

    "responsibilities": [],

    "deliverables": [],

    "weakness": ""
  },

  "roleCard": {

    "name": "",

    "alias": "",

    "archetypeFamily": "",

    "level": "",

    "primaryType": "",

    "operationalQuestion": "",

    "activationCondition": "",

    "authority": "",

    "signatureMove": "",

    "artifactProduced": [],

    "weakness": ""
  }
}
```

---

# 6. Scaling Rules

## Fixed

- archetype families
    
- layer separation
    
- authority boundaries
    
- observable artifacts
    

---

## Flexible

- persona details
    
- skill dimensions
    
- visual representation
    
- naming conventions
    

---

## Prohibited

- merging persona and role logic
    
- introducing capabilities absent from RoleCard
    
- removing weakness
    
- roles without artifacts
    
- unbounded authority
    

---

# 7. Core Constraint

Persona improves usability.

RoleCard provides execution.

If the RoleCard layer cannot:

- assign authority
    
- define activation
    
- produce artifacts
    
- expose weaknesses
    
- be evaluated
    

then the card fails regardless of persona quality.