#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="echobell-notify"
DEST_ROOT="${1:-${CODEX_HOME:-$HOME/.codex}/skills}"
DEST_DIR="${DEST_ROOT}/${SKILL_NAME}"

if [[ ! -e "${DEST_DIR}" ]]; then
  echo "Skill is not installed at ${DEST_DIR}"
  exit 0
fi

rm -rf "${DEST_DIR}"
echo "Removed ${DEST_DIR}"

