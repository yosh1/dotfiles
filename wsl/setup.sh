#!/bin/bash
# WSL2 (Ubuntu) setup for GPD Pocket4
#   curl -fsSL https://raw.githubusercontent.com/yosh1/dotfiles/master/wsl/setup.sh | bash
set -e

REPO="https://github.com/yosh1/dotfiles.git"
DOTFILES="$HOME/dotfiles"

info() { printf "\033[36m[info]\033[m %s\n" "$1"; }
ok()   { printf "\033[32m[ok]\033[m   %s\n" "$1"; }

# ============================================
# 1. apt packages
# ============================================
info "Installing apt packages..."
sudo apt-get update -y
sudo apt-get install -y zsh git tmux mosh curl wget unzip build-essential ca-certificates
ok "apt packages installed"

# ============================================
# 2. GitHub CLI (official apt repo)
# ============================================
if ! command -v gh &>/dev/null; then
  info "Installing GitHub CLI..."
  sudo mkdir -p -m 755 /etc/apt/keyrings
  wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
  sudo apt-get update -y
  sudo apt-get install -y gh
  ok "GitHub CLI installed"
else
  ok "GitHub CLI already installed"
fi

# ============================================
# 3. dotfiles
# ============================================
if [ ! -d "$DOTFILES" ]; then
  info "Cloning dotfiles..."
  git clone "$REPO" "$DOTFILES"
else
  git -C "$DOTFILES" pull --ff-only || true
fi

# ============================================
# 4. starship / mise / Claude Code
# ============================================
mkdir -p "$HOME/.local/bin" "$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"

if ! command -v starship &>/dev/null; then
  info "Installing starship..."
  curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
fi
ok "starship ready"

if ! command -v mise &>/dev/null; then
  info "Installing mise..."
  curl -fsSL https://mise.run | sh
fi
mise use -g node@lts
ok "mise + node ready"

if ! command -v claude &>/dev/null; then
  info "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi
ok "Claude Code ready"

# ============================================
# 5. Symlinks
# ============================================
info "Creating symlinks..."
ln -sf "$DOTFILES/wsl/.zshrc"             ~/.zshrc
ln -sf "$DOTFILES/wsl/.tmux.conf"         ~/.tmux.conf
ln -sf "$DOTFILES/git/.gitconfig"         ~/.gitconfig
ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml
ok "Symlinks created"

# ============================================
# 6. SSH key (new key per device, never copied)
# ============================================
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  info "Generating SSH key..."
  mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
  ssh-keygen -t ed25519 -C "gpd-pocket4-wsl" -f "$HOME/.ssh/id_ed25519" -N ""
  ok "SSH key generated"
else
  ok "SSH key already exists"
fi

# ============================================
# 7. Login shell
# ============================================
if [ "$(basename "$SHELL")" != "zsh" ]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
  ok "Default shell changed to zsh"
fi

echo ""
ok "Done! Next steps:"
echo "  1. exec zsh"
echo "  2. gh auth login   (GitHub.com → SSH → upload ~/.ssh/id_ed25519.pub → browser login)"
echo "  3. claude          (log in with your Claude account)"
