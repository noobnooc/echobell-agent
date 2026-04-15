#!/usr/bin/env bash
set -euo pipefail

DEST_ROOT="${1:-${CODEX_HOME:-$HOME/.codex}/skills}"

"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/uninstall-skill.sh" "${DEST_ROOT}"
echo "Codex native skill uninstall complete."
