Configures. Does not install everything.

```bash
# prereq: https://brew.sh
git clone git@github.com:teeeg/dotfiles.git path/to/dotfiles
cd path/to/dotfiles
chmod +x install.sh
./install.sh
```

Restart your terminal, then:

```bash
gh auth login
echo '[user]\n\temail = you@example.com' > ~/.gitconfig.local
```
