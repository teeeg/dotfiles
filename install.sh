#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Load Homebrew into PATH if it's installed in a standard location
if ! command -v brew &>/dev/null; then
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Require Homebrew, but don't install it here
if ! command -v brew &>/dev/null; then
  echo "Error: Homebrew not found."
  echo "Install it first from https://brew.sh, then rerun this script."
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
