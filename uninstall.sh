#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "======================================"
echo "  dotfiles-claude Uninstallation"
echo "======================================"
echo ""
echo "To uninstall, run these commands in a Claude Code session:"
echo ""
echo "  /plugin uninstall justin-tools@dotfiles-claude"
echo "  /plugin marketplace remove dotfiles-claude"
echo ""
echo "Then restart Claude Code."
echo ""
echo "======================================"
