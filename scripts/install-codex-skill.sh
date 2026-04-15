#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_ROOT="${1:-${CODEX_HOME:-$HOME/.codex}/skills}"

"${SCRIPT_DIR}/install-skill.sh" "${DEST_ROOT}"
echo "Codex native skill install complete."
echo "Restart Codex to pick up new skills."
