# Spec Template

The fillable structure for `./spec/spec.md`. Follow section order exactly (decision D11). Every normative statement MUST carry a decision citation `(D<nn>)` or an OPEN marker (D12, D40). If a section genuinely does not apply to the artifact type, keep the heading and write "Not applicable to this artifact type — <one-line reason (D<nn>)>".

---

# <Artifact Name> — Normative Specification

| Field | Value |
|---|---|
| Artifact | <one-line description> |
| Date | <YYYY-MM-DD> |
| Status | DRAFT (revision 1) |
| Decisions | <count> (D1 to D<nn>), <k> OPEN |
| Completeness at draft | <nn>% |
| Skill version | 0.1.0 |
| Author | <Oracle handle> |

<!-- Status lifecycle: DRAFT → REVIEW → FROZEN. Revision counter increments on each review pass. -->

## 0. How to Read This Spec

Written for the AI Builder that will implement this artifact. The human reviewer reads to verify intent.

- Status FROZEN means this spec is the single source of truth. Implementation MUST conform or raise a spec query citing a decision number.
- Lines beginning `NOTE:` are Oracle review annotations. The Scribe enumerates every NOTE and revises; the human does not edit normative text directly.
- OPEN markers are unresolved. Do not implement affected areas while OPEN items exist unless the Oracle records a waiver.
- MUST, SHOULD, MAY follow RFC 2119.

## 1. Goals and Non-Goals

### 1.1 Goals
- G-<n>. <One sentence, testable>. (D<nn>)

### 1.2 Non-Goals
- NG-<n>. <What this artifact explicitly will not do, and why in one clause>. (D<nn>)

Non-goals are decisions too. An artifact without a non-goal list has no boundary.

## 2. Data Model

Schemas of files, formats, entities, and interfaces the artifact depends on or produces. Include field lists, identity rules, size limits, and format examples where they constrain implementation. (Citations per statement.)

## 3. Normative Behavior

The MUST-level rules of the artifact, numbered (3.1, 3.2, ...) and grouped by subsystem. This is the section the Builder will quote back at review time. If a rule cannot be checked, it is not a rule; move it to section 8 as a criterion or delete it.

## 4. Error-Handling Matrix

| Condition | Required behavior | Decision |
|---|---|---|
| <trigger> | <required response> | (D<nn>) |

Cover: partial failure, missing inputs, invalid inputs, resource exhaustion, external-dependency loss, and the empty/loading/error states of primary surfaces.

## 5. Architecture

Structure and composition: components, folders, load order, extension points, dependencies, and what talks to what. A text or ASCII diagram is acceptable. Every component boundary cited.

## 6. Locked Decisions Log

Index of all decisions with one-line summaries, grouped by round or by concern. Full entries live in `decisions.md`. This index is what reviewers quote when annotating: "NOTE on D14: ..."

## 7. Acceptance Criteria

- AC-<n>. <Single-claim, individually testable statement: Given/When/Then or one checkable sentence>. (D<nn>)

An acceptance criterion that cannot fail is decoration. If you cannot imagine the test that would verify it, rewrite it.

## 8. Performance Targets

- PT-<n>. <Measurable target: time, size, latency, capacity, cost>. (D<nn>)

## 9. Design Conventions

Presentation and UX rules of the artifact: formats, templates, naming conventions, visual tokens, tone. The adapted successor of "design tokens" for non-visual artifacts. (Citations per statement.)

## 10. Open Questions

- OQ-<n> (D<nn>): <question> — <why it blocks or why it does not>.

If this section is non-empty at freeze, the freeze required a recorded waiver.

---

## Note Marker Convention

A review note is a line beginning `NOTE:` placed directly beneath the statement it annotates:

```
- G-3. The artifact works fully offline. (D9)
  NOTE: does "fully" include first-run before any data exists? — Oracle
```

The Scribe MUST enumerate every NOTE, ask a clarifying question only when the note is ambiguous or contradicts a locked decision, revise directly otherwise, and log each revision as a new decision.
