#!/usr/bin/env bash

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
readonly OUTPUT_DIR="$REPO_ROOT/runtime"
readonly OUTPUT_ZIP="$OUTPUT_DIR/INITIO-MASTER-RUNTIME.zip"

if [[ "$PWD" != "$REPO_ROOT" ]]; then
  printf 'ERROR: run this command from the repository root: bash scripts/export-runtime.sh\n' >&2
  exit 1
fi

required_files=(
  "README.md"
  "00-governance/EXECUTIVE-SYSTEM-RULES.md"
  "00-governance/SOURCE-OF-TRUTH-MAP.md"
  "00-governance/UPDATE-PROTOCOL.md"
  "00-governance/CONTINUITY-PROTOCOL.md"
  "00-governance/INITIO-MASTER-RUNTIME-LIFECYCLE.md"
  "10-identity/INITIO-EXECUTIVE-DIRECTOR.md"
  "20-state/MASTER-PROJECT-STATE.md"
  "20-state/CURRENT-PRIORITIES.md"
  "20-state/OPEN-DECISIONS.md"
  "20-state/LOCK-REGISTER.md"
  "20-state/RISK-REGISTER.md"
  "30-knowledge/PROJECT-MAP.md"
  "30-knowledge/EXECUTIVE-KNOWLEDGE.md"
  "30-knowledge/DECISION-HISTORY.md"
  "30-knowledge/WORKING-STANDARDS.md"
  "30-knowledge/USER-WORKING-PREFERENCES.md"
  "40-continuity/CURRENT-HANDOFF.md"
  "40-continuity/NEW-RUNTIME-START.md"
  "50-evidence/EVIDENCE-INDEX.md"
  "60-runtime/RUNTIME-PACKAGE-STANDARD.md"
  "60-runtime/RUNTIME-PACKAGE-CHECKLIST.md"
  "60-runtime/EXPORT-PROCEDURE.md"
)

for required_file in "${required_files[@]}"; do
  if [[ ! -f "$REPO_ROOT/$required_file" ]]; then
    printf 'ERROR: missing required runtime file: %s\n' "$required_file" >&2
    exit 1
  fi
done

runtime_temp="$(mktemp -d "${TMPDIR:-/tmp}/initio-runtime.XXXXXX")"
cleanup() {
  rm -rf "$runtime_temp"
}
trap cleanup EXIT

package_root="$runtime_temp/package"
candidate_zip="$runtime_temp/INITIO-MASTER-RUNTIME.zip"
mkdir -p "$package_root"

for required_file in "${required_files[@]}"; do
  mkdir -p "$package_root/$(dirname "$required_file")"
  cp "$REPO_ROOT/$required_file" "$package_root/$required_file"
done

cat > "$package_root/START-HERE.md" <<'EOF'
# INITIO MASTER — Start Here

Jsi další runtime instance kontinuální role `INITIO MASTER`; nejde o novou roli ani nový systém.

1. Nejdříve načti celý `40-continuity/NEW-RUNTIME-START.md`.
2. Potom načti všechny povinné soubory v pořadí uvedeném v tomto startovacím dokumentu.
3. Ověř aktuální `40-continuity/CURRENT-HANDOFF.md`.
4. Pokračuj od jediné `Exact Next Action`.
5. Nevymýšlej stav bez autoritativní evidence.
6. Pokud stav chybí nebo je rozporný, zastav pokračování a vyžádej `Reality Review`.

Historie předchozího chatu není potřeba. Po nahrání tohoto ZIPu stačí zpráva: `Jsi INITIO MASTER. Pokračuj.`
EOF

(
  cd "$package_root"
  zip -X -q -r "$candidate_zip" .
)

unzip -tq "$candidate_zip" >/dev/null

expected_manifest="$runtime_temp/expected-manifest.txt"
actual_manifest="$runtime_temp/actual-manifest.txt"
printf '%s\n' "${required_files[@]}" "START-HERE.md" | LC_ALL=C sort > "$expected_manifest"
unzip -Z1 "$candidate_zip" | sed '/\/$/d' | sed 's#^\./##' | LC_ALL=C sort > "$actual_manifest"

if ! diff -u "$expected_manifest" "$actual_manifest" >/dev/null; then
  printf 'ERROR: generated ZIP does not match the required runtime allowlist\n' >&2
  diff -u "$expected_manifest" "$actual_manifest" >&2 || true
  exit 1
fi

if grep -Eq '(^|/)(\.git|90-archive)(/|$)|\.zip$' "$actual_manifest"; then
  printf 'ERROR: generated ZIP contains a forbidden path\n' >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"
mv -f "$candidate_zip" "$OUTPUT_ZIP"

printf 'Runtime package created: runtime/INITIO-MASTER-RUNTIME.zip\n'
printf 'Validated files: %s\n' "$(wc -l < "$actual_manifest" | tr -d ' ')"
