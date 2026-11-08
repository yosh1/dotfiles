# WSL2 (GPD Pocket4) zshrc — macOS 用は zsh/.zshrc

# Resolve mise tools on demand instead of running mise at shell startup/prompts.
typeset -U path
path=("$HOME/.local/bin" "$HOME/.local/share/mise/shims" $path)
export PATH

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_dups

# Completion
# Ubuntu already initializes completion in /etc/zsh/zshrc.
# Keep the fallback for other systems; retain the normal security audit.
if (( ! ${+_comps} )); then
  autoload -Uz compinit && compinit
fi

# Tools
# Shims keep project-specific tool versions. For shell-level [env]/cd hooks,
# opt into full activation in that session: eval "$(mise activate zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"

alias yolo='claude --dangerously-skip-permissions'

# Code lives in ~/projects on the Linux filesystem; created during setup.
