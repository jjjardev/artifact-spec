# artifact-spec

A SKILL.md agent skill that turns a seed idea into a decision-complete, frozen specification through rounds of forced-choice questions, with a visible completeness meter, an append-only decision log, and an AI-revised, human-reviewed loop. It stops at the frozen spec. It never writes implementation code.

```
"I really want to create X for platform Y..."
        │
        ▼
  Interview loop          15-30 forced-choice questions per round,
  (3-6 rounds)            expert defaults, contradictions halt the loop,
                          context completeness: 63% ... 90% ... 97%
        │
        ▼
  ./spec/decisions.md     every choice, its status, its evidence
  ./spec/spec.md          the normative contract, Builder-first
  ./spec/open-questions.md  what remains, honestly
        │
        ▼
  Review loop             you add NOTE: lines, the AI revises,
                          every revision logged
        │
        ▼
  FROZEN                  hand the spec to your Builder agent
```

## Why

Most bad AI builds are not capability failures. They are silent-assumption failures: the prompt omitted a decision, the model guessed, and the guess executed confidently at hour six of a build that will now be redone. This skill moves every one of those decisions to the cheapest possible moment, before any code exists, by making the AI interview the human instead of interpreting them.

The design principles:

1. **Forced choice beats free text.** Lettered options with a marked expert default make answers loggable, contradictions detectable, and the loop finishable.
2. **The termination rule is mechanical.** The loop ends at a question fixpoint: when a full batch would contain only questions already answered or inferable. Hard caps (6 rounds, 90 questions) prevent runaway.
3. **The meter is structured, not vibes.** A weighted concern-area checklist you can audit, displayed after every round and stamped into the decision log.
4. **Everything persists every round.** Quit at round 3 and the log is still usable. Return later and the skill offers resume.
5. **The spec is written for a machine.** RFC 2119 normative statements, decision-number traceability, testable acceptance criteria, a reader's guide for the Builder agent that implements it.
6. **Drafting may not manufacture decisions.** Gaps found at draft time become OPEN markers, and freezing with OPEN items requires an explicit recorded waiver.

## Install

The installable skill lives at `skills/artifact-spec/`: `SKILL.md`, `references/`, and nothing else. The repo root holds the README, license, self-hosted spec, chat prompt, plugin manifests, and release scripts. Install the inner folder, not the repo root.

### Chat AI (no install)

For a single-file prompt that works in any chat AI, use [`artifact-spec-chat.prompt.md`](artifact-spec-chat.prompt.md). Paste everything below the divider as your first message, replace the `SEED:` line with your idea, and answer the rounds. A file system is optional.

### OpenCode (primary)

Global install:

```bash
git clone --depth 1 https://github.com/jjjardev/artifact-spec.git /tmp/artifact-spec
mkdir -p ~/.config/opencode/skills
cp -R /tmp/artifact-spec/skills/artifact-spec ~/.config/opencode/skills/
```

Project install:

```bash
git clone --depth 1 https://github.com/jjjardev/artifact-spec.git /tmp/artifact-spec
mkdir -p .opencode/skills
cp -R /tmp/artifact-spec/skills/artifact-spec .opencode/skills/
```

OpenCode also reads `.agents/skills/`, `.claude/skills/`, `~/.agents/skills/`, and `~/.claude/skills/`. The folder name must match `name: artifact-spec`.

Then say: "interview me for a spec" or "spec this idea: <your idea>".

### Install with the skills CLI

The latest CLI requires Node.js 22.20 or later.

```bash
# project scope
npx skills add jjjardev/artifact-spec --skill artifact-spec -a opencode

# global scope
npx skills add jjjardev/artifact-spec --skill artifact-spec -a opencode -g
```

On Node 20, use `npx skills@1.5.6 add ...` instead.

Add `--copy` when symlinks are not wanted. The CLI copies only `skills/artifact-spec/`. Global scope uses the host's global skills directory; OpenCode reads both `~/.agents/skills/` and `~/.config/opencode/skills/`.

### Claude Code (compatible)

Personal install:

```bash
git clone --depth 1 https://github.com/jjjardev/artifact-spec.git /tmp/artifact-spec
mkdir -p ~/.claude/skills
cp -R /tmp/artifact-spec/skills/artifact-spec ~/.claude/skills/
```

Project install:

```bash
git clone --depth 1 https://github.com/jjjardev/artifact-spec.git /tmp/artifact-spec
mkdir -p .claude/skills
cp -R /tmp/artifact-spec/skills/artifact-spec .claude/skills/
```

Plugin marketplace install. The repo ships `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`:

```text
/plugin marketplace add jjjardev/artifact-spec
/plugin install artifact-spec@artifact-spec
```

In a session, invoke the plugin skill as `/artifact-spec:artifact-spec`, or use the trigger phrases.

### Other Agent Skills hosts

The skill is pure markdown against the open Agent Skills standard. Any host that supports `SKILL.md` folders can load it. Use `npx skills add ... -a <agent>` for supported hosts, or copy `skills/artifact-spec/` into that host's skills directory.

### Validate and package

From the repo root:

```bash
uvx --from 'git+https://github.com/agentskills/agentskills#subdirectory=skills-ref' \
  skills-ref validate skills/artifact-spec
```

Build release archives:

```bash
./scripts/package.sh
```

This writes `dist/artifact-spec.skill` with `SKILL.md` at the archive root (Claude.ai upload format) and `dist/artifact-spec.zip` with an `artifact-spec/` folder at the root (manual install archive).

## The Three Files It Produces

| File | What it is |
|---|---|
| `spec.md` | The normative contract: goals, non-goals, data model, behavior rules, error matrix, architecture, acceptance criteria, performance targets. Header carries status (DRAFT / REVIEW / FROZEN) and a revision counter. |
| `decisions.md` | Append-only log of every decision with its status: DECIDED (you chose), DELEGATED (you accepted the expert default, rationale recorded), INFERRED (resolved from your seed, evidence cited), INHERITED (from your repo's standing constraints), OPEN (unresolved). |
| `open-questions.md` | Every unresolved item and why it blocks. Empty this before freeze, or waive explicitly. |

## Review Loop

Add a line beginning `NOTE:` under any statement in `spec.md`. The skill enumerates every note, asks a clarifying question only where a note is ambiguous or contradicts a locked decision, revises directly otherwise, and logs each revision as a new decision. You review; the AI revises; the log keeps the audit trail.

## Case Study

The skill specified itself. Version 0.1.0's specification was produced by this exact loop in a single session: 60 answered questions across 3 rounds (20 / 30 / 10), completeness tracked 63% to 90% to 97% at the fixpoint, 65 logged decisions, 2 OPEN items resolved or waived at freeze. The self-hosted case study is the evidence base for the method's claims about human time and decision volume.

## Scope

v1 targets software artifacts. For non-software artifacts, the skill applies its adaptation rule (re-derive concern groups from the artifact type) built into the question taxonomy.

## License

MIT. See LICENSE.

## Author

jjjardev. github.com/jjjardev
