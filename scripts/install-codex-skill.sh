#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILL_NAME="echobell-notify"
SOURCE_DIR="${REPO_ROOT}/skills/${SKILL_NAME}"
DEST_ROOT="${1:-${CODEX_HOME:-$HOME/.codex}/skills}"
DEST_DIR="${DEST_ROOT}/${SKILL_NAME}"

if [[ ! -d "${SOURCE_DIR}" ]]; then
  echo "Skill source not found: ${SOURCE_DIR}" >&2
  exit 1
fi

mkdir -p "${DEST_ROOT}"

if [[ -e "${DEST_DIR}" ]]; then
  echo "Destination already exists: ${DEST_DIR}" >&2
  echo "Remove it first or run ./scripts/uninstall-codex-skill.sh" >&2
  exit 1
fi

cp -R "${SOURCE_DIR}" "${DEST_DIR}"

echo "Installed ${SKILL_NAME} to ${DEST_DIR}"
echo "Restart Codex to pick up new skills."

