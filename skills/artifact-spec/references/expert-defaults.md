# Expert Defaults

How to construct, mark, and defend expert defaults, and how to handle delegation, inference, and recommendations.

## The Principle

The loop separates **preference** from **expertise**. The Oracle owns taste and intent. You own craft knowledge. An expert default is where you spend your expertise so the Oracle spends their tokens only on things that are genuinely theirs.

## Constructing a Default

1. Default to the option that best survives contact with reality: least data loss, fewest moving parts, reversible, boring where boring is safe.
2. One option MUST be marked `**[expert default]**` per question. Exactly one. A question without a default is a failed question.
3. Add a one-line rationale ONLY when the default is surprising, non-obvious, or interacts with an earlier decision. Rationale example: "[expert default: (a) content-hash detection, because size and mtime lie after external edits]".
4. Never mark a default on a pure preference question (naming, color, taste). For those, present options neutrally; the Oracle must own the call.
5. If your default contradicts an earlier Oracle answer, say so in the rationale line. Do not hide the conflict and do not resolve it yourself; that is a contradiction, and contradictions halt the loop.

## Delegation (`DELEGATED`)

When the Oracle answers "whatever is best" (or accepts the default without comment):

- Accept it. Do not push the decision back; refusal turns the Scribe into a bureaucracy.
- Log as `DELEGATED` with the chosen option stated explicitly plus the one-line rationale. "AI decides" is not an entry; a future reader must be able to audit what was actually chosen and why.
- At draft time, delegated decisions appear in the Locked Decisions Log exactly like decided ones. The Oracle can veto any of them during review by adding a `NOTE:` line; the veto becomes a new decision.

## Inference (`INFERRED`)

When the seed or conversation already answers a question:

- Do NOT ask it. Asking what is already known teaches the Oracle to distrust the meter.
- Log `INFERRED` with the evidence quoted or cited: `D7 [INFERRED] offline-first storage — seed states "must work with no internet"; source: seed, R1`.
- If your inference is load-bearing (it constrains later questions), state it to the Oracle in one line when presenting the next batch, so it can be corrected cheaply.

## Inheritance (`INHERITED`)

Standing constraint files (CLAUDE.md, AGENTS.md, CONTRIBUTING, existing specs) are read before Round 1. Constraints that shape decisions are logged as `INHERITED` with the file cited. The spec must never fight the repo it lives in.

## Sloppy Affirmations

"Yeah", "sure", "ok", "sounds good" to a question with a visible default mean: confirm the default. Log as `DELEGATED` with the note "confirmed verbally". If the affirmation is ambiguous (no default was visible, or multiple defaults were on screen), ask one clarifying question. Never guess across ambiguity.

## Recommendations Mid-Loop

When the Oracle asks "what would you do":

1. Give a direct recommendation. Refusing is a failure mode, not neutrality.
2. Attach the one-line rationale.
3. Let the Oracle confirm (log `DECIDED`) or delegate (log `DELEGATED`).
4. Never recommend on pure taste; say so and hand the decision back.

## Question Hygiene

- Blast radius first: a decision that constrains five later questions precedes one that constrains none.
- No compound questions ("should it sync and encrypt?"). Split them.
- No leading questions ("you want it fast, right?"). Options are symmetric; the default carries your opinion, the phrasing does not.
- Every question must be answerable in under 30 seconds by a decision-maker with the seed in mind.
