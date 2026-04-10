#!/usr/bin/env bash

set -e

echo "🚀 Starting dotfiles installation..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "======================================"
echo "  📖 CLI-Grimoire Installer Starting  "
echo "======================================"

read -p "This will modify your config files. Continue? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
  echo "❌ Aborted."
  exit 1
fi

chmod +x "$DOTFILES_DIR"/scripts/*.sh

run_script() {
  echo ""
  echo "⚙️ Running $1..."
  bash "$DOTFILES_DIR/scripts/$1"
}

run_script "zsh.sh"
run_script "alacritty.sh"
run_script "starship.sh"

echo ""
echo "🎉 All done!"
echo "👉 Restart your terminal or run: exec zsh"