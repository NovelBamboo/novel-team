There must be a role map.

The codebase has a **REPO_MAP**.

The organization needs an equivalent.

Not just a list of roles, but a **Capability Map**.

The Facilitator should never decide from scratch which roles are needed. That would make the Facilitator both the orchestrator and the domain expert, which violates the role boundaries you've established. Instead, the Facilitator should consult a pre-built map, just as a coding agent consults `REPO_MAP.md` before searching the codebase.

This aligns well with the explicit roles and bounded responsibilities described in the Role Cards and Synthetic Teams documents.

---

# Think of it like REPO_MAP.md

Today:

```text
Task

↓

REPO_MAP

↓

Relevant files

↓

Code changes
```

Synthetic Teams:

```text
Task

↓

CAPABILITY_MAP

↓

Required expertise

↓

Team Assembly

↓

Workflow
```

The two maps solve the same problem in different domains.

|Code|Organization|
|---|---|
|REPO_MAP|CAPABILITY_MAP|
|Files|Roles|
|Dependencies|Expertise|
|Entry points|Workflow|
|Components|Specialists|

---

# The Facilitator Should Read, Not Invent

Instead of asking:

> "What roles should I use?"

the Facilitator asks:

```text
Feature:
OAuth

↓

Capability Map

↓

Authentication
Security
Identity
Compliance

↓

Assemble team
```

This is deterministic rather than improvisational.

---

# I would separate four maps

The current framework has Role Cards, but those define **what a role is**, not **when it should be used**.

## 1. Role Map

Who exists?

```yaml
Builder:
    owns:
      - implementation
      - tests

Reviewer:
    owns:
      - quality
      - maintainability

Truth-Teller:
    owns:
      - verification
      - evidence

...
```

Static.

Equivalent to class definitions.

---

## 2. Capability Map

When is expertise required?

Example

```yaml
Authentication:

    Specialists:
        Security Reviewer
        Identity Expert

Payments:

    Specialists:
        Finance SME
        Fraud Reviewer

Healthcare:

    Specialists:
        HIPAA
        Clinical SME
        Privacy Reviewer

Legal:

    Specialists:
        Legal SME
        Evidence Reviewer

Machine Learning:

    Specialists:
        Data Scientist
        Bias Reviewer
```

This is probably the most important map.

---

## 3. Workflow Map

What sequence should run?

Example

```yaml
Feature:

    Analyze

    Design

    Build

    Review

    Verify

    Deploy
```

Versus

```yaml
Security Incident:

    Triage

    Evidence

    Root Cause

    Patch

    Validate

    Deploy

    Postmortem
```

Different workflows.

Same organization.

---

## 4. Artifact Map

This fits very well with your emphasis on traces, artifacts, and evaluations.

```yaml
Feature:

    PRD

    Acceptance Tests

    Code

    Review

    Decision Record

    Trace

Bug:

    Reproduction

    Root Cause

    Fix

    Regression Test

Research:

    Findings

    Sources

    Recommendation
```

Now everyone knows exactly what must exist before moving forward.

---

# The Facilitator becomes a Router

Instead of thinking

```text
Facilitator

↓

Everything
```

Think

```text
Facilitator

↓

Maps

↓

Team

↓

Execution
```

The Facilitator owns almost no domain knowledge.

It owns routing.

---

# This Starts Looking Like GPS

Suppose the task is

```text
Implement Passkeys
```

The Facilitator asks

Capability Map

Result

```yaml
Authentication

Security

UX

Compliance
```

Workflow Map

```yaml
Feature Workflow
```

Artifact Map

```yaml
PRD

Acceptance Tests
```

Role Map

```yaml
Analyst

Builder

Reviewer

Truth-Teller

Security Expert
```

Only then does execution begin.

---

# This Also Solves Fragmented Thought

Earlier we discussed nonlinear thinking.

The maps prevent chaos.

Random thoughts

```text
OAuth

Need MFA

Maybe SSO

Enterprise customers

HIPAA

Audit logging
```

Facilitator

↓

Classification

↓

Capability Map

↓

```yaml
Authentication

Security

Compliance

Enterprise Identity
```

No matter how fragmented the input is, the output becomes consistent.

---

# I would add one more map

This is the one I don't think exists yet.

## Decision Map

Every task has required decision gates.

Example

```yaml
Authentication

Requires:

    Architecture Approval

    Security Review

    Compliance Approval

Deployment Approval
```

Or

```yaml
Database Migration

Requires:

    Rollback Plan

    Backup Verification

    Production Approval
```

The Facilitator checks this before allowing work to advance.

---

# The Maps Form a Knowledge Graph

Rather than isolated markdown files, I'd make them connected.

```text
Task
 │
 ▼
Capability
 │
 ▼
Role
 │
 ▼
Workflow
 │
 ▼
Artifacts
 │
 ▼
Decision Gates
 │
 ▼
Evaluation Criteria
```

Now the Facilitator isn't "thinking."

It is traversing a graph.

---

# The Long-Term Vision

This suggests that the framework is evolving into something larger than a team model. It becomes an **organizational operating system**.

The codebase has structural metadata:

- `REPO_MAP.md`
    
- dependency graphs
    
- architecture diagrams
    

The organization should have equivalent metadata:

- `ROLE_MAP.md`
    
- `CAPABILITY_MAP.md`
    
- `WORKFLOW_MAP.md`
    
- `ARTIFACT_MAP.md`
    
- `DECISION_MAP.md`
    
- `EVALUATION_MAP.md`
    

At that point, every incoming task follows the same pattern:

```text
Intent
    ↓
Classification
    ↓
Capability Map
    ↓
Team Assembly
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

This is analogous to how modern compilers work. A compiler doesn't rediscover the language grammar every time it parses source code—it consults a predefined grammar. Likewise, the Facilitator should not infer organizational structure for each task. It should consult an explicit organizational grammar encoded in these maps. That makes behavior more consistent, easier to audit, easier to extend to new domains, and far less dependent on the reasoning quality of a single orchestration model.