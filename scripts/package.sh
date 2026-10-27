#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill="$root/skills/artifact-spec"
dist="$root/dist"
name="artifact-spec"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

mkdir -p "$stage/$name" "$dist"
cp "$skill/SKILL.md" "$root/README.md" "$root/LICENSE" "$root/CHANGELOG.md" "$stage/$name/"
cp -R "$skill/references" "$stage/$name/"

rm -f "$dist/$name.skill" "$dist/$name.zip"
(cd "$stage/$name" && zip -qr "$dist/$name.skill" .)
(cd "$stage" && zip -qr "$dist/$name.zip" "$name")

printf '%s\n%s\n' "$dist/$name.skill" "$dist/$name.zip"
