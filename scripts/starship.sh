#!/usr/bin/env bash

set -e

echo "Setting up Starship..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

if [ -f "$CONFIG_DIR/starship.toml" ]; then
  echo "📦 Backing up existing starship.toml..."
  mv "$CONFIG_DIR/starship.toml" "$CONFIG_DIR/starship.toml.backup"
fi

echo "Linking starship.toml..."
ln -sf "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"

echo "✅ Starship setup complete!"