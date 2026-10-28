#!/usr/bin/env bash
set -euo pipefail

# Verify the skill's three outputs against spec.md sections 2.1-2.3 (D10, D48).
# Usage: scripts/verify-outputs.sh [spec-dir]
#   spec-dir defaults to ./spec. Exits non-zero on any structural violation.

dir="${1:-spec}"
python3 - "$dir" <<'PY'
import re
import sys
from pathlib import Path

d = Path(sys.argv[1])
errors = []
warnings = []

dec_p = d / "decisions.md"
spec_p = d / "spec.md"
oq_p = d / "open-questions.md"

dec_text = dec_p.read_text() if dec_p.exists() else None
spec_text = spec_p.read_text() if spec_p.exists() else None
oq_text = oq_p.read_text() if oq_p.exists() else None

print(f"verify-outputs: {d}")

# --- 2.1 decisions.md ---
if dec_text is None:
    errors.append("2.1 decisions.md missing")
else:
    for key in ("Project:", "Started:", "Skill version:", "Completeness history:"):
        if key not in dec_text:
            errors.append(f'2.1 decisions.md header missing "{key}"')
    entries = re.findall(r"^- (D(\d+)) \[([^\]]+)\] (.*)$", dec_text, re.M)
    if not entries:
        errors.append("2.1 no decision entries found")
    valid_status = {"DECIDED", "DELEGATED", "INFERRED", "INHERITED", "OPEN"}
    nums = []
    open_count = 0
    for label, n, status, rest in entries:
        nums.append(int(n))
        s = status.strip()
        if s not in valid_status and not s.startswith("OPEN→"):
            errors.append(f"2.1 {label} invalid STATUS [{s}]")
        if "—" not in rest:
            errors.append(f"2.1 {label} entry lacks source/suffix citation")
        if s == "OPEN":
            open_count += 1
    if nums and nums != list(range(1, len(nums) + 1)):
        errors.append(f"2.1 decision numbers not sequential from D1 (D{nums[0]}..D{nums[-1]}, {len(nums)} entries)")
    delegated = sum(1 for _, _, s, _ in entries if s.strip() == "DELEGATED")
    if delegated:
        warnings.append(f"2.1 {delegated} DELEGATED entries: confirm each states chosen option + one-line rationale")
    if not errors:
        print(f"  2.1 decisions.md: PASS ({len(entries)} entries, D1..D{nums[-1]}, {open_count} OPEN)")

# --- 2.2 spec.md ---
status_val = ""
if spec_text is None:
    errors.append("2.2 spec.md missing")
else:
    if not spec_text.lstrip().startswith("# "):
        errors.append("2.2 spec.md missing title heading")
    for key in ("| Date |", "| Status |", "| Decisions |", "| Completeness at draft |", "| Skill version |", "| Author |"):
        if key not in spec_text:
            errors.append(f'2.2 spec.md header missing "{key}"')
    m = re.search(r"^\| Status \| (.+?) \|$", spec_text, re.M)
    if m:
        status_val = m.group(1)
        if not re.match(r"(DRAFT|REVIEW|FROZEN)", status_val):
            errors.append(f'2.2 invalid status value "{status_val}"')
    else:
        errors.append("2.2 spec.md status row not found")

    headings = re.findall(r"^## (?:\d+\.\s*)?(.+?)\s*$", spec_text, re.M)
    required = [
        "How to Read This Spec",
        "Goals and Non-Goals",
        "Data Model",
        "Normative Behavior",
        "Error-Handling Matrix",
        "Architecture",
        "Locked Decisions Log",
        "Acceptance Criteria",
        "Performance Targets",
        "Design Conventions",
        "Open Questions",
    ]
    pos = -1
    for name in required:
        found = next((i for i, h in enumerate(headings) if name in h), None)
        if found is None:
            errors.append(f'2.2 spec.md missing section "{name}"')
        elif found <= pos:
            errors.append(f'2.2 section "{name}" out of order')
        else:
            pos = found

    norm = 0
    for i, line in enumerate(spec_text.splitlines(), 1):
        if re.match(r"^\d+\.\d+\.", line) or re.match(r"^- (?:G|NG|AC|PT|DC)-\d+\.", line):
            norm += 1
            if not re.search(r"\(D\d+", line) and "OPEN" not in line:
                errors.append(f"2.2 untraceable normative statement at spec.md:{i}: {line[:70]}")
    if not any("2.2" in e for e in errors):
        print(f"  2.2 spec.md: PASS (sections in order, {norm} normative statements traced, status {status_val.split(' ')[0] or '?'})")

# --- 2.3 open-questions.md ---
frozen = status_val.startswith("FROZEN")
waived = bool(dec_text and re.search(r"waiv", dec_text, re.I)) if dec_text else False
if oq_text is None:
    if frozen:
        print("  2.3 open-questions.md: PASS (absent at FROZEN; allowed by 2.3)")
    else:
        errors.append("2.3 open-questions.md missing and spec is not FROZEN")
else:
    items = [ln.strip() for ln in oq_text.splitlines() if ln.strip() and not ln.strip().startswith("#")]
    for ln in items:
        if not re.match(r"^-?\s*OQ-\d+ \[[^\]]+\] .+ — .+$", ln):
            errors.append(f"2.3 bad open-question format: {ln[:70]}")
    if frozen and items and not waived:
        errors.append("2.3 FROZEN spec has open questions and no recorded waiver (D55)")
    if frozen and not items:
        print("  2.3 open-questions.md: PASS (empty at FROZEN)")
    elif not errors:
        print(f"  2.3 open-questions.md: PASS ({len(items)} items{', waiver recorded' if waived else ''})")

    if dec_text:
        open_decisions = [l for l, _, s, _ in entries if s.strip() == "OPEN"]
        if open_decisions and not items:
            warnings.append(f"2.3 {len(open_decisions)} OPEN decisions but open-questions.md has no items")

for w in warnings:
    print(f"WARN: {w}")
for e in errors:
    print(f"FAIL: {e}")
print(f"result: {'FAIL' if errors else 'PASS'}")
sys.exit(1 if errors else 0)
PY
