#!/usr/bin/env bash

set -e

echo "🚀 Starting dotfiles installation..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "======================================"
echo "  📖 CLI-Grimoire Installer Starting  "
echo "======================================"

chmod +x "$DOTFILES_DIR"/scripts/*.sh

run_script() {
  echo ""
  echo "⚙️ Running $1..."
  bash "$DOTFILES_DIR/scripts/$1"
}

run_script "zsh.sh"
run_script "alacritty.sh"
run_script "starship.sh"
run_script "dnf.sh"

echo ""
echo "🎉 All done!"
echo "👉 Restart your terminal or run: exec zsh"