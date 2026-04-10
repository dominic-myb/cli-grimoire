#!/usr/bin/env bash

set -e

echo "📦 Configuring DNF..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="$DOTFILES_DIR/dnf/dnf.conf"
TARGET_FILE="/etc/dnf/dnf.conf"

# Check if running with sudo
if [[ "$EUID" -ne 0 ]]; then
  echo "⚠️  This step requires sudo privileges..."
fi

# Backup existing config
if [ -f "$TARGET_FILE" ]; then
  echo "📦 Backing up existing dnf.conf..."
  sudo cp "$TARGET_FILE" "$TARGET_FILE.backup"
fi

# Copy new config
echo "📄 Applying new dnf.conf..."
sudo cp "$SOURCE_FILE" "$TARGET_FILE"

echo "✅ DNF configuration applied!"