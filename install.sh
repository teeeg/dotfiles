#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Check brew
if ! command -v brew &>/dev/null; then
  echo "Error: Homebrew not found. Install it first."
  exit 1
fi

# Install packages
echo "Installing packages..."
brew bundle --file="$DOTFILES/Brewfile"

# Symlink files
echo "Creating symlinks..."
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.zenv" "$HOME/.zenv"
ln -sf "$DOTFILES/.zaliases" "$HOME/.zaliases"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/.gitignore_global" "$HOME/.gitignore_global"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"

echo ""
echo "Done! Restart your terminal."
