#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

bash -n "${REPO_ROOT}/scripts/install-codex-skill.sh"
bash -n "${REPO_ROOT}/scripts/uninstall-codex-skill.sh"

CODEX_HOME="${TMP_DIR}/codex-home" "${REPO_ROOT}/scripts/install-codex-skill.sh"

SKILL_DIR="${TMP_DIR}/codex-home/skills/echobell-notify"

[[ -f "${SKILL_DIR}/SKILL.md" ]]
[[ -f "${SKILL_DIR}/agents/openai.yaml" ]]
[[ -f "${SKILL_DIR}/references/setup.md" ]]
[[ -f "${SKILL_DIR}/references/payloads.md" ]]

grep -q '^name: echobell-notify$' "${SKILL_DIR}/SKILL.md"
grep -q '^description:' "${SKILL_DIR}/SKILL.md"

echo "Skill validation passed."

