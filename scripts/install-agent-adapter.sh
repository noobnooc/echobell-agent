#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <agents-md|claude-code|cursor|windsurf|copilot> <workspace>" >&2
  exit 1
fi

ADAPTER="$1"
WORKSPACE="$(cd "$2" && pwd)"

copy_file() {
  local source="$1"
  local target="$2"

  mkdir -p "$(dirname "${target}")"

  if [[ -e "${target}" ]]; then
    echo "Target already exists: ${target}" >&2
    exit 1
  fi

  cp "${source}" "${target}"
  echo "Installed ${target}"
}

case "${ADAPTER}" in
  agents-md)
    copy_file "${REPO_ROOT}/templates/AGENTS.md" "${WORKSPACE}/AGENTS.md"
    ;;
  claude-code)
    copy_file "${REPO_ROOT}/templates/AGENTS.md" "${WORKSPACE}/AGENTS.md"
    copy_file "${REPO_ROOT}/templates/CLAUDE.md" "${WORKSPACE}/CLAUDE.md"
    ;;
  cursor)
    copy_file "${REPO_ROOT}/adapters/cursor/echobell-notify.mdc" \
      "${WORKSPACE}/.cursor/rules/echobell-notify.mdc"
    ;;
  windsurf)
    copy_file "${REPO_ROOT}/adapters/windsurf/echobell-notify.md" \
      "${WORKSPACE}/.windsurf/rules/echobell-notify.md"
    ;;
  copilot)
    copy_file "${REPO_ROOT}/adapters/copilot/copilot-instructions.md" \
      "${WORKSPACE}/.github/copilot-instructions.md"
    ;;
  *)
    echo "Unknown adapter: ${ADAPTER}" >&2
    exit 1
    ;;
esac

