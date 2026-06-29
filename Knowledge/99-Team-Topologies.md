[_Team Topologies_](https://teamtopologies.com/book) is one of the most important books to incorporate—but not literally.

It would be a mistake to map human teams directly to AI agents. 

Instead of asking:

> "What kinds of AI agents should exist?"

Ask:

> "How should cognitive work be partitioned so the system continues to scale?"

That is exactly what _Team Topologies_ addresses.

---

# 1. Cognitive Load becomes the Primary Design Constraint

This is probably the single biggest contribution.

The book argues that teams fail because they carry too much cognitive load.

Synthetic teams have exactly the same problem.

Instead of:

```
One AI
Everything
```

You get

```
Requirements
Architecture
Implementation
Review
Deployment
Verification
Documentation
Evaluation
```

inside one context window.

Eventually the model begins thrashing.

Instead every role owns a bounded cognitive domain.

|Human Team Topologies|Synthetic Team|
|---|---|
|Team cognitive load|Context window load|
|Team responsibilities|Prompt responsibility|
|Knowledge boundary|Context boundary|
|Team ownership|Artifact ownership|

The design principle becomes

> Every role should fit comfortably inside one context window.

---

# 2. Stream-Aligned Teams

This maps almost perfectly.

Instead of organizing by technology...

```
Frontend Team

Backend Team

Infrastructure Team
```

organize around value streams.

Synthetic example

```
Feature Team

Authentication Team

Payments Team

Search Team

Reporting Team
```

Each stream contains:

- Analyst
    
- Builder
    
- Reviewer
    
- Truth-teller
    

The Operator and Facilitator become platform-wide services.

---

# 3. Platform Teams

This is where the biggest opportunity lies.

A synthetic organization will quickly accumulate infrastructure that every team needs.

Examples

- prompt libraries
    
- evaluation pipelines
    
- trace storage
    
- artifact schemas
    
- MCP servers
    
- authentication
    
- model routing
    
- telemetry
    
- policy engine
    
- deployment tooling
    

Instead of every Builder reinventing these...

Create Platform Teams.

For example

```
Developer Platform
```

owns

- Repo templates
    
- CLI
    
- Spec generation
    
- Coding standards
    

---

```
AI Platform
```

owns

- model routing
    
- LiteLLM
    
- MCP
    
- caching
    
- prompt versions
    
- evaluations
    

---

```
Observability Platform
```

owns

- Phoenix
    
- OpenTelemetry
    
- dashboards
    
- metrics
    
- traces
    

---

These teams serve every stream.

---

# 4. Enabling Teams

This maps beautifully.

Human enabling teams teach.

Synthetic enabling teams increase capability.

Examples

Security Advisor

Architecture Advisor

Performance Advisor

Accessibility Advisor

Cost Optimization Advisor

Rather than participating continuously...

They join only when requested.

Example

```
Builder

↓

Performance Advisor

↓

Builder resumes
```

This keeps context small.

---

# 5. Complicated Subsystem Teams

Some knowledge is too specialized.

Examples

Compiler optimization

Cryptography

GPU programming

Distributed consensus

ML optimization

Rather than contaminating every Builder...

Create specialist synthetic experts.

```
Distributed Systems Team

↓

Consensus Expert

↓

Builder
```

---

# 6. Team APIs

This may be the most important concept in the book.

Every team exposes a predictable interface.

Synthetic teams should do exactly the same.

Example

Builder API

Inputs

```
Specification

Acceptance Tests

Architecture

Task
```

Outputs

```
Implementation

Tests

Documentation

Known Issues
```

Reviewer API

Inputs

```
Implementation

Requirements
```

Outputs

```
Findings

Severity

Recommendations
```

Truth API

Inputs

```
Claims

Evidence
```

Outputs

```
Verified Claims

Confidence

Contradictions
```

Now every role is replaceable.

---

# 7. Interaction Modes

The book defines interaction modes.

These translate almost directly.

### Collaboration

Temporary.

```
Analyst

+

Builder

+

Reviewer

```

working together.

---

### X-as-a-Service

Platform teams.

```
Builder

↓

Telemetry Platform

```

No discussion required.

---

### Facilitating

Advisor joins temporarily.

```
Builder

↓

Security Advisor

↓

Builder continues
```

Exactly how enabling teams work.

---

# 8. Team Boundaries

Perhaps the biggest gap in existing agent frameworks.

Most multi-agent systems let every agent see everything.

Bad idea.

Each role should have explicit visibility.

Builder

May read

- specs
    
- code
    
- tests
    

Cannot read

- production secrets
    
- deployment credentials
    

Operator

Can deploy

Cannot rewrite requirements

Truth-Teller

Can inspect everything

Cannot modify implementation

Boundaries reduce hallucination and accidental coupling.

---

# 9. Conway's Law

Human organizations produce software that mirrors communication.

Synthetic teams will too.

If every role talks to every other role...

You get spaghetti.

Instead

```
Analyst

↓

Builder

↓

Reviewer

↓

Truth

↓

Operator
```

Only Facilitator has global visibility.

This reduces communication complexity dramatically.

---

# 10. Cognitive Load Metrics

This is a new contribution beyond the book.

Measure load.

Builder

```
Files touched

Dependencies

Functions modified

Context tokens

Tool invocations

Review findings
```

Reviewer

```
Files reviewed

Comments

Defects

Complexity

Coverage
```

Analyst

```
Requirements

Decision Records

Acceptance Tests

Unknowns
```

Once load exceeds thresholds...

Split the work.

---

# 11. Dynamic Team Topologies

Unlike human teams, synthetic teams can reconfigure at runtime.

Normal

```
Analyst

Builder

Reviewer
```

Security incident

```
Analyst

Builder

Security Reviewer

Truth-Teller

Operator

Incident Commander
```

Performance issue

```
Analyst

Builder

Performance Expert

Reviewer
```

Research task

```
Research Analyst

Truth-Teller

Architect

```

Topology becomes workload-dependent.

---

# 12. Team Cognitive Budget

A concept worth adding to the framework.

Every role has a budget.

```
Context

Attention

Token budget

Artifact count

Dependencies

Tool complexity
```

When exceeded

Split the role.

Example

Instead of

```
Analyst
```

becomes

```
Business Analyst

Technical Analyst

Data Analyst

Evaluation Analyst
```

---

# 13. Organizational Memory

_Team Topologies_ emphasizes reducing cognitive burden through clear ownership. For synthetic teams, that ownership should extend beyond code to every durable artifact.

Every artifact has exactly one owning role:

|Artifact|Owner|
|---|---|
|Requirements|Analyst|
|ADRs|Analyst|
|Task graph|Facilitator|
|Code|Builder|
|Review report|Reviewer|
|Truth report|Truth-Teller|
|Deployment record|Operator|
|Traces|Platform Observability|
|Evaluation results|Evaluation Platform|

Ownership is explicit, versioned, and discoverable.

---

## One principle to extend beyond _Team Topologies_

The book is primarily about **organizational topology**—how work is divided and coordinated. Synthetic teams also need an **epistemic topology**: a structure governing how knowledge is challenged, validated, and accepted.

This complements the adversarial model discussed earlier.

Two independent structures emerge:

- **Organizational topology** (from _Team Topologies_): who owns work, interfaces, and interactions.
    
- **Epistemic topology** (an extension): who generates ideas, who challenges them, who verifies evidence, who authorizes execution, and under what conditions decisions are reopened.
    

The resulting synthetic organization is defined by two orthogonal dimensions:

|Organizational Topology|Epistemic Topology|
|---|---|
|Stream-aligned teams|Independent verification|
|Platform teams|Truth-Teller|
|Enabling teams|Expert challengers|
|Team APIs|Evidence contracts|
|Cognitive load|Confidence budgets|
|Interaction modes|Adversarial deliberation|
|Team boundaries|Decision rights|
|Conway's Law|Information flow control|

Taken together, these form a stronger architecture than either approach alone. _Team Topologies_ explains how to scale work; the synthetic framework adds how to scale reasoning, verification, and decision quality. The combination is well suited to AI-driven engineering organizations because both execution and epistemic integrity remain explicit, observable, and measurable.