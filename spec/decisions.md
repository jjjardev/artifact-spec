# Decision Log — artifact-spec skill

Project: artifact-spec (a SKILL.md agent skill that produces spec.md)
Author: jjjardev
Started: 2026-10-27
Skill version: 0.1.1
Revision: 3
Status: FROZEN (Round 3 fixpoint; post-freeze corrections D66-D69)
Completeness history: R1 63% → R2 90% → R3 97% (fixpoint)

Format: `D<nn> [STATUS] decision — source: Q<n>, round <r>`
Post-freeze corrections cite the Oracle instruction instead of a question number.
Statuses: DECIDED (Oracle chose), DELEGATED (Oracle accepted the expert default or "whatever is best" on a decision question, with rationale; pure taste cannot be delegated), INFERRED (resolved from seed evidence), INHERITED (from standing repo constraints, existing repo documents, or a derived concern-group table), OPEN (unresolved).

## Round 1

- D1 [DECIDED] Skill name is `artifact-spec`. — Q1, R1
- D2 [DECIDED] Scope v1 = interview loop plus spec outputs; stops before any build stage. — Q2, R1
- D3 [DECIDED] Software-first domain coverage with one adaptation rule: concern groups are re-derived from the artifact type; generalization deferred to v2. — Q3, R1
- D4 [DECIDED] Existing-document invocation enters gap-analyze mode: interview only what the document fails to specify; emit completed spec. — Q4, R1
- D5 [DELEGATED] Batch size adaptive 15 to 30, highest-stakes decisions first; rationale: answer fatigue degrades later rounds; a reference case study collapsed 30/30/10/5. — Q5, R1
- D6 [DELEGATED] Termination = question-fixpoint (a full batch would contain only answered or inferable questions), hard cap 6 rounds. — Q6, R1
- D7 [DELEGATED] Contradictions halt the loop and must be resolved before the next batch. — Q7, R1
- D8 [DELEGATED] "Whatever is best" accepted, logged as DELEGATED with the chosen option and one-line rationale. — Q8, R1
- D9 [DELEGATED] One-line question rationale only when non-obvious or when the default contradicts an earlier answer. — Q9, R1
- D10 [DELEGATED] Outputs: spec.md, decisions.md, open-questions.md. — Q10, R1
- D11 [DELEGATED] Fixed spec structure: goals and non-goals, data model, normative format rules, error-handling matrix, architecture, locked decisions log, acceptance criteria, performance targets, design tokens (adapted per artifact type per D3). — Q11, R1
- D12 [DELEGATED] Every normative statement in spec.md traces to a decision number or an OPEN marker; untraceable statements are deleted at draft time. — Q12, R1
- D13 [DELEGATED] Files written to ./spec/ in the working directory. — Q13, R1
- D14 [DECIDED] Provenance: presented as original work with no external method connection, hosted on the jjjardev persona. — Q14, R1 (user modification of default)
- D15 [DECIDED] Host persona/repo: jjjardev. — Q15, R1
- D16 [DELEGATED] Fully self-contained; no runtime external fetches. — Q16, R1
- D17 [DELEGATED] Distribution: free on GitHub, listed on Agensi at $9; evidence per D21. — Q17, R1
- D18 [DECIDED] No bundling with any other skill or toolkit, ever. — Q18, R1 (user override of default)
- D19 [DELEGATED] decisions.md written incrementally after every round, enabling mid-loop quit and resume. — Q19, R1
- D20 [DELEGATED] Pure markdown per the open Agent Skills standard; cross-agent compatibility declared. — Q20, R1

## Round 2

- D21 [DECIDED] Case study for listing evidence is this very specification session (a spec produced by the method across 3 rounds and 60 questions). — Q21, R2
- D22 [DECIDED] Name `artifact-spec` kept; the word is generic. — Q22, R2
- D23 [DELEGATED] Completeness meter is a structured weighted concern-area checklist, not a gut estimate. — Q23, R2
- D24 [DELEGATED] Meter displayed in chat per round and stamped into decisions.md header. — Q24, R2
- D25 [DELEGATED] "Draft now" early exit allowed at any point; unresolved areas become OPEN markers. — Q25, R2
- D26 [DELEGATED] "Go deeper" reopens the loop past fixpoint in adversarial mode (stress-testing existing answers). — Q26, R2
- D27 [DELEGATED] Triggering: description matching plus explicit trigger phrases. — Q27, R2
- D28 [DELEGATED] Resume: auto-detect ./spec/decisions.md, summarize state, offer resume. — Q28, R2
- D29 [DELEGATED] File collision: ask overwrite / version to spec-v2/ / abort. — Q29, R2
- D30 [DECIDED] Input is conversational only; the seed idea arrives as chat text; no argument-passing mechanism. — Q30, R2 (user choice a with rationale)
- D31 [DECIDED] Question format: forced-choice lettered options with exactly one marked expert default; Oracle may append inline notes to any answer, with a standardized, easy-to-type note syntax. — Q31, R2 (user note)
- D32 [DELEGATED] Ten concern groups: usage, data model, file behavior, UI, platform, privacy, security, error/failure behavior, performance, distribution/licensing, future-proofing, observability (collapsed to ten groups). — Q32, R2
- D33 [DELEGATED] Within-batch ordering ranked by blast radius. — Q33, R2
- D34 [DELEGATED] Never ask what the seed already answers; log as INFERRED with cited evidence. — Q34, R2
- D35 [DELEGATED] Hard cap 90 answered questions across the loop. — Q35, R2
- D36 [DELEGATED] spec.md header: title, date, status, decision count, completeness at draft time, skill version. — Q36, R2
- D37 [DELEGATED] English with RFC 2119 normative keywords (MUST, SHOULD, MAY). — Q37, R2
- D38 [DELEGATED] Acceptance criteria numbered and individually testable. — Q38, R2
- D39 [DELEGATED] Mandatory self-audit pass before writing spec.md: verify traceability, report failures, then write. — Q39, R2
- D40 [DELEGATED] Contradictions discovered during drafting are emitted as OPEN, never silently resolved. — Q40, R2
- D41 [DELEGATED] Sloppy affirmations ("yeah", "sure") confirm the expert default, logged as such. — Q41, R2
- D42 [DELEGATED] New requirements volunteered mid-loop are absorbed and spawn follow-up questions. — Q42, R2
- D43 [DECIDED] The primary reader of spec.md is the AI Builder that will implement the artifact; the human reviews and annotates; the AI revises. On request the Scribe gives a recommendation with rationale; the Oracle confirms or delegates. — Q43, R2 (user note)
- D44 [DELEGATED] Gap-analyze on large documents: distill to a structured seed first, then interview only the gaps. — Q44, R2
- D45 [DELEGATED] Existing CLAUDE.md / AGENTS.md are read first and honored; logged as INHERITED decisions. — Q45, R2
- D46 [DELEGATED] Full frontmatter: license, compatibility, metadata (author, version). — Q46, R2
- D47 [DELEGATED] License: MIT. — Q47, R2
- D48 [DELEGATED] Pre-release testing: two end-to-end runs (one fresh idea, one gap-analyze), outputs verified, logged as case studies. — Q48, R2
- D49 [DELEGATED] Semver in frontmatter metadata, CHANGELOG in repo. — Q49, R2
- D50 [DECIDED] Agensi listing deferred; v1 goal is a functioning skill only. — Q50, R2 (user modification)

## Round 3

- D51 [DELEGATED] Review loop is in v1: post-draft human review with AI revision is core, not an add-on. — Q51, R3
- D52 [DECIDED] Review notes attach as inline markers inside spec.md; syntax MUST be easy to type. — Q52, R3 (user note: "easy to type")
- D53 [DELEGATED] Each note: clarifying questions only when ambiguous or contradicting a locked decision; direct revision otherwise; every revision logged as a new numbered decision. — Q53, R3
- D54 [DELEGATED] Status lifecycle DRAFT → REVIEW → FROZEN, revision counter in spec header increments per review pass. — Q54, R3
- D55 [DELEGATED] Freeze requires zero OPEN markers or an explicit recorded waiver. — Q55, R3
- D56 [DELEGATED] spec.md opens with a "How to read this spec" preamble aimed at the AI Builder. — Q56, R3
- D57 [DELEGATED] Frontmatter author: jjjardev. — Q57, R3
- D58 [DELEGATED] Meter weights are fixed defaults in the question-taxonomy reference file; domain rule may override. — Q58, R3
- D59 [DELEGATED] Deliverable is a repo-ready skill folder (SKILL.md, references/, assets/, README, LICENSE, CHANGELOG), zipped. — Q59, R3
- D60 [DELEGATED] Build order: spec.md first, Oracle review, then skill files written against the frozen spec, then two test runs. — Q60, R3

## Drafting-time amendments (this draft)

- D61 [DECIDED] Note marker syntax: a note is a line beginning with `NOTE:` placed directly beneath the statement it annotates (typing cost: one word plus colon; machine-findable by line prefix). — implements D52
- D62 [OPEN→WAIVED] Public-facing naming of the method inside README and listing copy — deferred with D50 to post-validation; waived at freeze via D64.
- D63 [OPEN→RESOLVED] Exact weight values of the ten concern groups in the meter — fixed via D65.

## Freeze record (2026-10-27)

- D64 [DECIDED] Freeze waiver: OQ-1 (public branding, D62) is waived for v1 per D50's deferral of all listing and branding work; it blocks no implementation. Oracle instruction "now create the skill and stuff" recorded as the freeze authorization. — source: Oracle, freeze turn
- D65 [DECIDED] Meter weights fixed in references/question-taxonomy.md: data model 1.4, privacy 1.3, security 1.3, error/failure 1.3, usage 1.2, platform 1.0, file behavior 1.0, UI 0.9, performance and observability 0.8, distribution/future-proofing 0.7. Resolves OQ-2 (D63). — source: implementation against D58, D63

## Post-freeze corrections (2026-10-28, v0.1.1)

- D66 [DECIDED] Forced choice with exactly one expert default applies to decision questions only; pure preference questions (naming, color, taste) present neutral options with no default, and the Oracle's choice is logged as DECIDED. — clarifies D31; source: Oracle, post-freeze correction
- D67 [DECIDED] Pure taste cannot be DELEGATED; on a recommendation request, the Scribe hands the decision back instead of recommending or accepting delegation. — clarifies D8, D43; source: Oracle, post-freeze correction
- D68 [DECIDED] Sloppy affirmations confirm only a single visible expert default; if no default or multiple defaults were on screen, the Scribe MUST ask. — clarifies D41; source: Oracle, post-freeze correction
- D69 [DECIDED] INHERITED covers standing constraints, existing repo documents, and derived concern-group tables, with the source cited. — clarifies D45; source: Oracle, post-freeze correction

Status: FROZEN. Spec revision 3. Zero OPEN items. Post-freeze corrections D66-D69 applied.
