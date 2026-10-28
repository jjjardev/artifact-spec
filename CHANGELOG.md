# Changelog

All notable changes to this skill are documented here. Format based on Keep a Changelog; versioning is semantic.

## [0.1.1] - 2026-10-28

### Added
- `artifact-spec-chat.prompt.md`: standalone, no-install chat edition for any chat AI, with optional file access and a resumable `STATE BLOCK`.
- README: install-free Chat AI path.
- Release archives now include the chat prompt.

### Fixed
- Pure preference questions no longer require an expert default and cannot be delegated.
- Sloppy affirmations confirm only a single visible default; ambiguous batches ask.
- `INHERITED` now covers derived concern-group tables, matching `question-taxonomy.md`.
- Chat and skill decision statuses, delegation rules, and the completeness meter are aligned.
- Self-hosted spec and decision log updated to v0.1.1 with post-freeze corrections D66-D73.
- Batch rule now allows a short final round; skipped-question and non-applicable-area meter rules are aligned across skill and chat; v1 drops `assets/`; plugin manifests are not listing materials.

## [0.1.0] - 2026-10-27

### Added
- OpenCode-first install paths and `npx skills` instructions.
- Claude Code plugin manifests (`.claude-plugin/`) and marketplace install path.
- `scripts/package.sh` release archives and `scripts/validate.sh`.
- GitHub Actions validation for Agent Skills frontmatter and manifests.
- SKILL.md: the interview loop protocol (modes, batches, answer processing, decision statuses, completeness meter, termination and escapes, drafting self-audit, review loop, freeze gate, condensed error handling).
- `references/question-taxonomy.md`: ten concern groups with fixed meter weights, question patterns per group, meter computation procedure, non-software adaptation rule.
- `references/expert-defaults.md`: default construction rules, DELEGATED / INFERRED / INHERITED handling, sloppy-affirmation policy, mid-loop recommendation policy, question hygiene.
- `references/spec-template.md`: the fillable normative spec structure with per-section guidance and the `NOTE:` review-marker convention.
- README, LICENSE (MIT), CHANGELOG.
- Self-hosted case study: the skill specified itself in 3 rounds and 60 questions before shipping (see README).

### Changed
- Installable skill lives at `skills/artifact-spec/`; references are tracked and ship with every install archive.
