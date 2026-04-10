#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Starting dotfiles installation..."

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done

SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"

if command -v git >/dev/null 2>&1 && git -C "$SCRIPT_DIR" rev-parse --show-toplevel >/dev/null 2>&1; then
  DOTFILES_DIR="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"
else
  DOTFILES_DIR="$SCRIPT_DIR"
fi

echo "📦 Dotfiles root: $DOTFILES_DIR"

echo "======================================"
echo "  📖 CLI-Grimoire Installer Starting  "
echo "======================================"

read -r -p "This will modify your config files. Continue? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
  echo "❌ Aborted."
  exit 1
fi

SCRIPTS_DIR="$DOTFILES_DIR/scripts"

if [[ -d "$SCRIPTS_DIR" ]]; then
  shopt -s nullglob
  scripts=("$SCRIPTS_DIR"/*.sh)

  if (( ${#scripts[@]} > 0 )); then
    chmod +x "${scripts[@]}"
  else
    echo "⚠️ No .sh scripts found in scripts/"
  fi
else
  echo "❌ Missing scripts directory: $SCRIPTS_DIR"
  exit 1
fi

run_script() {
  local script="$1"
  local path="$SCRIPTS_DIR/$script"

  if [[ -f "$path" ]]; then
    echo ""
    echo "⚙️ Running $script..."
    bash "$path"
  else
    echo "⚠️ Skipping missing script: $script"
  fi
}

run_script "zsh.sh"
run_script "alacritty.sh"
run_script "starship.sh"

echo ""
echo "🎉 All done!"
echo "👉 Restart your terminal or run: exec zsh"