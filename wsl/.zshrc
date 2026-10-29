# WSL2 (GPD Pocket4) zshrc — macOS 用は zsh/.zshrc

export PATH="$HOME/.local/bin:$PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_dups

# Completion
autoload -Uz compinit && compinit

# Tools
command -v mise &>/dev/null && eval "$(mise activate zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"

alias yolo='claude --dangerously-skip-permissions'

# Code lives in the Linux filesystem (not /mnt/c) for fast I/O
mkdir -p ~/projects
