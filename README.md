# dotfiles

macOS development environment configuration files.

## Structure

```
ghostty/          Ghostty terminal config, shaders, and custom theme
zsh/              Zsh configuration (Prezto + pure prompt)
starship/         Starship prompt theme (black & yellow)
git/              Git global configuration
claude/           Claude Code settings and custom instructions
cursor/           Cursor editor MCP config
vim/              Vim configuration
mac/              macOS system preferences script
editor/           EditorConfig
```

## New Mac Setup

```bash
# 1. Clone
git clone https://github.com/yosh1/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Run setup script (installs Homebrew, packages, creates symlinks)
./setup.sh
```

The setup script handles:
- Homebrew installation
- CLI tools (git, gh, starship, nvm, rbenv, terminal-notifier, vim, tmux)
- GUI apps (Ghostty, Cursor, VS Code)
- Prezto (zsh framework)
- All symlinks (configs listed below)
- macOS system preferences (optional, interactive)

## WSL2 (Ubuntu) Setup — GPD Pocket4

```bash
curl -fsSL https://raw.githubusercontent.com/yosh1/dotfiles/master/wsl/setup.sh | bash
```

Installs zsh, git, gh, tmux, mosh, starship, mise (Node LTS), Claude Code, links `wsl/.zshrc`, `wsl/.tmux.conf`, `git/.gitconfig`, `starship/starship.toml`, and generates a new SSH key for the device. Then run `gh auth login` and `claude`.

## Manual Symlinks

If you prefer to link individual configs:

```bash
# Ghostty
ln -sf $(pwd)/ghostty/config  ~/.config/ghostty/config
ln -sf $(pwd)/ghostty/shaders ~/.config/ghostty/shaders
ln -sf $(pwd)/ghostty/themes  ~/.config/ghostty/themes

# Shell
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/starship/starship.toml ~/.config/starship.toml

# Git
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig

# AI tools
ln -sf $(pwd)/claude/CLAUDE.md     ~/.claude/CLAUDE.md
ln -sf $(pwd)/claude/settings.json ~/.claude/settings.json
ln -sf $(pwd)/cursor/mcp.json      ~/.cursor/mcp.json

# Editor
ln -sf $(pwd)/vim/.vimrc ~/.vimrc
ln -sf $(pwd)/editor/.editorconfig ~/.editorconfig
```
