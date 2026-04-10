#!/usr/bin/env bash

set -e

echo "Setting up Zsh..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CONFIG_DIR="$HOME/"

mkdir -p "$CONFIG_DIR"

if [ -f "$CONFIG_DIR/.zshrc" ]; then
  echo "📦 Backing up existing .zshrc..."
  mv "$CONFIG_DIR/.zshrc" "$CONFIG_DIR/.zshrc.backup"
fi

echo "Linking .zshrc..."
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$CONFIG_DIR/.zshrc"

echo "✅ Zsh setup complete!"