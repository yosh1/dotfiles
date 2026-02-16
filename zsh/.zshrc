export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export PATH=/usr/local/bin:$PATH

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -Uz promptinit
prompt pure


# rbenv
export PATH="$HOME/.rbenv/bin:$PATH" 
eval "$(rbenv init - zsh)"

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yoshihisakaino/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yoshihisakaino/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yoshihisakaino/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yoshihisakaino/google-cloud-sdk/completion.zsh.inc'; fi
alias yolo='claude --dangerously-skip-permissions'
alias claude="/Users/yoshihisakaino/.claude/local/claude"
export SKIP_AUTH=true

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/yoshihisakaino/.lmstudio/bin"
# End of LM Studio CLI section

