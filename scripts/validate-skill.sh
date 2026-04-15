#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

bash -n "${REPO_ROOT}/scripts/install-skill.sh"
bash -n "${REPO_ROOT}/scripts/uninstall-skill.sh"
bash -n "${REPO_ROOT}/scripts/install-agent-adapter.sh"
bash -n "${REPO_ROOT}/scripts/install-codex-skill.sh"
bash -n "${REPO_ROOT}/scripts/uninstall-codex-skill.sh"

AGENT_SKILLS_HOME="${TMP_DIR}/agent-skills-home" "${REPO_ROOT}/scripts/install-skill.sh"
GENERIC_SKILL_DIR="${TMP_DIR}/agent-skills-home/echobell-notify"

[[ -f "${GENERIC_SKILL_DIR}/SKILL.md" ]]
[[ -f "${GENERIC_SKILL_DIR}/agents/openai.yaml" ]]
[[ -f "${GENERIC_SKILL_DIR}/references/setup.md" ]]
[[ -f "${GENERIC_SKILL_DIR}/references/payloads.md" ]]

CODEX_HOME="${TMP_DIR}/codex-home" "${REPO_ROOT}/scripts/install-codex-skill.sh"

SKILL_DIR="${TMP_DIR}/codex-home/skills/echobell-notify"

[[ -f "${SKILL_DIR}/SKILL.md" ]]
[[ -f "${SKILL_DIR}/agents/openai.yaml" ]]
[[ -f "${SKILL_DIR}/references/setup.md" ]]
[[ -f "${SKILL_DIR}/references/payloads.md" ]]

grep -q '^name: echobell-notify$' "${SKILL_DIR}/SKILL.md"
grep -q '^description:' "${SKILL_DIR}/SKILL.md"

WORKSPACE_ROOT="${TMP_DIR}/workspace"
mkdir -p "${WORKSPACE_ROOT}"
"${REPO_ROOT}/scripts/install-agent-adapter.sh" agents-md "${WORKSPACE_ROOT}"
grep -q '^# Echobell Notify$' "${WORKSPACE_ROOT}/AGENTS.md"

CLAUDE_WORKSPACE="${TMP_DIR}/claude-workspace"
mkdir -p "${CLAUDE_WORKSPACE}"
"${REPO_ROOT}/scripts/install-agent-adapter.sh" claude-code "${CLAUDE_WORKSPACE}"
grep -q '^@AGENTS.md$' "${CLAUDE_WORKSPACE}/CLAUDE.md"

CURSOR_WORKSPACE="${TMP_DIR}/cursor-workspace"
mkdir -p "${CURSOR_WORKSPACE}"
"${REPO_ROOT}/scripts/install-agent-adapter.sh" cursor "${CURSOR_WORKSPACE}"
[[ -f "${CURSOR_WORKSPACE}/.cursor/rules/echobell-notify.mdc" ]]

WINDSURF_WORKSPACE="${TMP_DIR}/windsurf-workspace"
mkdir -p "${WINDSURF_WORKSPACE}"
"${REPO_ROOT}/scripts/install-agent-adapter.sh" windsurf "${WINDSURF_WORKSPACE}"
[[ -f "${WINDSURF_WORKSPACE}/.windsurf/rules/echobell-notify.md" ]]

COPILOT_WORKSPACE="${TMP_DIR}/copilot-workspace"
mkdir -p "${COPILOT_WORKSPACE}"
"${REPO_ROOT}/scripts/install-agent-adapter.sh" copilot "${COPILOT_WORKSPACE}"
[[ -f "${COPILOT_WORKSPACE}/.github/copilot-instructions.md" ]]

echo "Skill validation passed."
