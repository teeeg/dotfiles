## Install

```bash
# Install Homebrew first: https://brew.sh
git clone git@github.com:teeeg/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

Restart your terminal.

## Post-install

```bash
# GitHub CLI
gh auth login

# Git email (per machine)
echo '[user]\n\temail = you@example.com' > ~/.gitconfig.local
```
