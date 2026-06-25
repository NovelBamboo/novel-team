The baseline telemetry model is not "chat history". It is:

> **Traces + Artifacts + Evaluation Outcomes + Tools**

These become the memory and audit trail of the synthetic organization.

---

# Synthetic Team Instrumentation Architecture

```
Intent
  ↓
Task
  ↓
Role Execution
  ↓
Artifacts
  ↓
Evaluations
  ↓
Outcome
  ↓
Feedback
```

Every role should leave behind:

- Traces (what happened)
    
- Artifacts (what was produced)
    
- Evaluation results (was it good?)
    
- Tool calls (how was it done)
    

---

# Truth-Teller

### Mission

Verify reality.

### Traces

- Claims examined
    
- Sources consulted
    
- Contradictions found
    
- Confidence score
    

### Artifacts

```
truth-report.md
risk-log.md
assumption-register.md
contradiction-report.md
```

### Evaluations

|Metric|Goal|
|---|---|
|Verified claim ratio|>95%|
|False alarms|low|
|Escaped errors|near zero|
|Hallucination catches|increasing|

### Tools

Read-only:

- Search
    
- Documentation
    
- Database queries
    
- Static analyzers
    
- Security scanners
    

No write privileges.

---

# Analysts

### Mission

Convert intention into executable specification.

### Traces

- Requirements derived
    
- Assumptions
    
- Questions raised
    

### Artifacts

```
prd.md
spec.md
acceptance-tests.md
adr.md
task-graph.json
```

### Evaluations

|Metric|
|---|
|Spec completeness|
|Ambiguity count|
|Rework caused by bad specs|
|Requirements coverage|

### Tools

- diagrams
    
- architecture tools
    
- research
    
- issue trackers
    

---

# Builder

### Mission

Produce implementation.

### Traces

- Files touched
    
- Commands run
    
- Time spent
    
- Dependencies introduced
    

### Artifacts

```
commits
tests
docs
migration scripts
patches
```

### Evaluations

|Metric|
|---|
|Build success|
|Tests pass|
|Review acceptance|
|Reopened defects|

### Tools

Read/write:

- IDE
    
- Terminal
    
- CI
    
- Git
    
- Package managers
    

---

# Reviewer

### Mission

Quality assurance.

### Traces

- Findings
    
- Severity
    
- Recommendations
    

### Artifacts

```
review-report.md
security-review.md
performance-review.md
```

### Evaluations

|Metric|
|---|
|Defects caught|
|Review acceptance|
|False positives|
|Coverage|

### Tools

Read-only:

- Linters
    
- Test suites
    
- Security scanners
    
- Diff tools
    

---

# Operator

### Mission

Execute systems safely.

### Traces

- Deploys
    
- Rollbacks
    
- Commands
    
- Environment changes
    

### Artifacts

```
runbooks
deploy logs
incident reports
rollback records
```

### Evaluations

|Metric|
|---|
|Deploy success|
|MTTR|
|Rollback frequency|
|SLO violations|

### Tools

Privileged:

- CI/CD
    
- Kubernetes
    
- Cloud
    
- Secrets
    
- Databases
    

Only role with production power.

---

# Facilitator

### Mission

Orchestrate.

### Traces

Everything.

### Artifacts

```
ledger.json
state-summary.md
decision-log.md
handoff-records.md
```

### Evaluations

|Metric|
|---|
|Queue latency|
|Stalled tasks|
|Trace completeness|
|Conflict age|

### Tools

- Workflow engine
    
- Temporal
    
- LangGraph
    
- Queue systems
    

No authority over truth.

---

# Unified Trace Structure

Every span contains:

```json
{
  "trace_id":"",
  "task_id":"",
  "role":"",
  "parent_span":"",
  "model":"",
  "tool_calls":[],
  "inputs":[],
  "outputs":[],
  "artifacts":[],
  "evaluation":{},
  "timestamp":""
}
```

---

# Artifact Graph

```
Intent
│
├── PRD
├── Spec
├── ADR
│
└── Task Graph
      ↓

Builder
│
├── Code
├── Tests
├── Docs
│
↓
Reviewer

review.md

↓
Truth-Teller

truth-report.md

↓
Operator

deploy-log.md

↓
Telemetry
```

---

# Evaluation Hierarchy

## Level 0

Role self-check

Builder runs tests.

---

## Level 1

Peer evaluation

Reviewer examines builder.

---

## Level 2

Independent evaluation

Truth-teller verifies reviewer.

---

## Level 3

Runtime evaluation

Production telemetry.

---

## Level 4

Human evaluation

Customer outcomes.

---

# Minimum OpenTelemetry Spans

```
TaskSpan
    AnalysisSpan
    BuildSpan
    ReviewSpan
    TruthSpan
    DeploySpan
```

Attributes:

```
role
model
tool
artifact
evaluation_score
cost
duration
success
```

---

# Phoenix Evaluations

Each artifact receives:

### Correctness

0-10

### Completeness

0-10

### Maintainability

0-10

### Confidence

0-10

### Groundedness

0-10

### Risk

0-10

Stored alongside traces.

---

# Role Tool Matrix

|Role|Read|Write|Execute|Deploy|
|---|---|---|---|---|
|Truth|✓|✗|✗|✗|
|Analyst|✓|Specs|✗|✗|
|Builder|✓|Code|Sandbox|✗|
|Reviewer|✓|Reviews|Tests|✗|
|Operator|✓|Config|✓|✓|
|Facilitator|Metadata|Ledger|Workflow|✗|

---

# The Real Memory

Not:

```
chat history
```

But:

```
Traces
+
Artifacts
+
Evaluations
+
Tool executions
```

These four things become the organizational memory.

The synthetic team itself becomes an observable system rather than a collection of conversations.

A mature implementation starts looking less like "multiple AI agents" and more like a miniature software company with its own telemetry, evidence chain, and operational history.