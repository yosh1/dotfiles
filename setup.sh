#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

info() { printf "\033[36m[info]\033[m %s\n" "$1"; }
warn() { printf "\033[33m[warn]\033[m %s\n" "$1"; }
ok()   { printf "\033[32m[ok]\033[m   %s\n" "$1"; }

# ============================================
# 1. Homebrew
# ============================================
if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ok "Homebrew installed"
else
  ok "Homebrew already installed"
fi

# ============================================
# 2. Brew packages
# ============================================
info "Installing brew packages..."
brew install git gh starship nvm rbenv terminal-notifier tmux vim

# ============================================
# 3. Cask apps
# ============================================
info "Installing cask apps..."
brew install --cask ghostty cursor visual-studio-code

# ============================================
# 4. Zsh / Prezto
# ============================================
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  info "Installing Prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  ok "Prezto installed"
else
  ok "Prezto already installed"
fi

# ============================================
# 5. Symlinks
# ============================================
info "Creating symlinks..."

mkdir -p ~/.config/ghostty
mkdir -p ~/.config
mkdir -p ~/.claude

# Ghostty
ln -sf "$DOTFILES/ghostty/config"  ~/.config/ghostty/config
ln -sf "$DOTFILES/ghostty/shaders" ~/.config/ghostty/shaders
ln -sf "$DOTFILES/ghostty/themes"  ~/.config/ghostty/themes
ok "Ghostty config linked"

# Zsh
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ok ".zshrc linked"

# Starship
ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml
ok "starship.toml linked"

# Git
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig
ok ".gitconfig linked"

# Vim
ln -sf "$DOTFILES/vim/.vimrc" ~/.vimrc
ok ".vimrc linked"

# EditorConfig
ln -sf "$DOTFILES/editor/.editorconfig" ~/.editorconfig
ok ".editorconfig linked"

# Claude Code
ln -sf "$DOTFILES/claude/CLAUDE.md"    ~/.claude/CLAUDE.md
ln -sf "$DOTFILES/claude/settings.json" ~/.claude/settings.json
ok "Claude Code config linked"

# Cursor
mkdir -p ~/.cursor
ln -sf "$DOTFILES/cursor/mcp.json" ~/.cursor/mcp.json
ok "Cursor MCP config linked"

# ============================================
# 6. macOS defaults
# ============================================
read -p "Apply macOS system preferences? (y/N): " apply_macos
if [ "$apply_macos" = "y" ]; then
  bash "$DOTFILES/mac/.macos"
  ok "macOS preferences applied"
else
  warn "Skipped macOS preferences"
fi

echo ""
ok "Setup complete! Restart your terminal to apply all changes."
