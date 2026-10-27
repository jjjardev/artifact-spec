# Question Taxonomy

Concern groups for the interview loop, with fixed meter weights. Default target: software projects. For non-software artifacts, re-derive groups from the artifact type using the adaptation rule (keep the group count at 8 to 10, keep a 1.5 to 0.5 weight spread, keep blast-radius ordering).

## The Ten Groups (software default)

| # | Group | Weight | What it covers |
|---|---|---|---|
| 1 | Data model | 1.4 | Entities, fields, relationships, identity, storage format, migration, size limits |
| 2 | Privacy | 1.3 | Personal data, local vs cloud, retention, export, deletion, compliance posture |
| 3 | Security | 1.3 | Auth, secrets, input validation, permissions, attack surface, trust boundaries |
| 4 | Error and failure behavior | 1.3 | Failure modes, partial failure, recovery, degraded modes, data loss policy |
| 5 | Usage | 1.2 | Who uses it, core workflow, first-run experience, primary jobs, what success looks like |
| 6 | Platform | 1.0 | OS, runtime, devices, offline behavior, install/update, minimum versions |
| 7 | File behavior | 1.0 | Formats read and written, import/export, external edits, locking, versioning |
| 8 | UI | 0.9 | Surfaces, navigation, states (empty, loading, error), accessibility, theming |
| 9 | Performance and observability | 0.8 | Speed targets, capacity, logging, metrics, debuggability |
| 10 | Distribution, licensing, and future-proofing | 0.7 | Packaging, update channel, license, extensibility, what is explicitly out of scope |

Weights are fixed defaults (decision D58, values fixed per D63 revision). Bounded 0.5 to 1.5. They are ratios, not percentages; normalize by dividing each by the total when computing the meter.

## Meter Computation

1. Identify every concern area that applies to this artifact (usually all ten for software).
2. Each area is resolved when every question raised in it has a DECIDED, DELEGATED, INFERRED, or INHERITED decision, and no OPEN markers reference it.
3. `completeness = sum(weights of resolved areas) / sum(weights of all identified areas)`, rounded to whole percent.
4. Display: `Context completeness: <nn>%`. Optionally append the one or two largest unresolved areas in parentheses.
5. Stamp the percentage into the completeness history in `decisions.md`.

## Question Patterns by Group

Write questions as forced choice with 2 to 4 lettered options and exactly one **[expert default]**. Patterns, not scripts; adapt to the seed.

### Data model
- "Where does the data live: (a) local only, (b) local + cloud sync, (c) cloud only? [expert default: (a), pending a sync requirement in the seed]"
- "What is the smallest unit of user content (the entity everything else hangs off)?"
- "What happens to identifiers when records are deleted?"

### Privacy
- "May the artifact transmit any data off device: (a) never, (b) only with explicit action, (c) freely? [expert default: (b)]"
- "Does the Oracle need an export path for all user data? [expert default: yes]"

### Security
- "Does the artifact hold secrets (keys, tokens, passwords): (a) none, (b) user-supplied, (c) embedded? [expert default: (a)]"
- "What is the trust boundary? Who can read what?"

### Error and failure behavior
- "When an operation fails halfway, what must be true afterward: (a) all-or-nothing, (b) best effort with a report, (c) undefined? [expert default: (a) for data writes]"
- "What does the user see when the artifact cannot reach the network?"

### Usage
- "Describe the single most important workflow in one sentence. If there are two candidates, which one justifies this artifact existing?"
- "What must be true after the first five minutes of use?"

### Platform
- "Target platform(s) and minimum version? [expert default: infer from seed, ask only if ambiguous]"
- "Must it work offline: (a) fully, (b) read-only, (c) no? [expert default: (a) if seed says local]"

### File behavior
- "Which file formats must it read and write?"
- "If a file is edited externally while open, detect or ignore? [expert default: detect by content hash]"

### UI
- "One surface or many? What is on the first screen?"
- "What are the three states of the main view: empty, loading, error?"

### Performance and observability
- "What operation, if slow, would make the Oracle call this broken? What number is acceptable?"
- "When something goes wrong on the Oracle's device, what evidence should the artifact leave behind?"

### Distribution, licensing, future-proofing
- "Where does this ship: (a) public repo, (b) private, (c) store? [expert default: infer from seed]"
- "What is explicitly NOT in v1? Force a non-goal list."

## Adaptation Rule (non-software artifacts)

Keep the loop identical. Replace the table:

1. Re-derive 8 to 10 concern groups from the artifact type (for a document: audience, structure, evidence, voice, constraints, distribution, maintenance, non-goals).
2. Assign weights 0.5 to 1.5 by blast radius.
3. Record the derived table as an INHERITED decision before Round 1 so the meter stays auditable.
