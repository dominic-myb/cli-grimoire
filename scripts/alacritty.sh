#!/usr/bin/env bash

set -e

echo "Setting up Alacritty..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CONFIG_DIR="$HOME/.config/alacritty"

mkdir -p "$CONFIG_DIR"

if [ -f "$CONFIG_DIR/alacritty.toml" ]; then
  echo "📦 Backing up existing alacritty.toml..."
  mv "$CONFIG_DIR/alacritty.toml" "$CONFIG_DIR/alacritty.toml.backup"
fi

echo "Linking alacritty.toml..."
ln -sf "$DOTFILES_DIR/alacritty/alacritty.toml" "$CONFIG_DIR/alacritty.toml"

echo "✅ Alacritty setup complete!"