# Init PATH
set -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin

set -x LANG "ja_JP.UTF-8"

# Fish
set -x fish_greeting ""

# Git
function commit_empty 
  git commit --allow-empty -m "NOPR: squash me [ci skip]"
end

function gitco
  set argv $argv "-"
  git checkout $argv[1]
end

function hp
  history | peco
end

echo "config.fish is loaded."

# Flutter
set PATH $HOME/flutter/bin $PATH

# Android 
set PATH /Users/yoshi1125hisa/Library/Android/sdk/platform-tools $PATH

# GOPATH
set -Ux GOPATH $HOME/Desktop/Go

# fish theme
# set fish_theme yimmy

# Linux Command
alias mk='touch'

# Git Command
alias ga "git add"
alias gp "git push"
alias gc "git commit -m"

# Python
alias p3 "python3"
alias python "python3"
alias pip "pip3"

# Docker
alias dcub "sudo docker-compose up --build"

# mongodb
set PATH /Users/yoshi1125hisa/mongodb/bin $PATH

# rbenv
set PATH "$HOME/.rbenv/bin" $PATH
. (rbenv init - | psub)

# flutter
set -x PATH /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin /Users/yoshi1125hisa/flutter/bin:/Users/yoshi1125hisa/.rbenv/shims:/Users/yoshi1125hisa/.pyenv/shims:/Users/yoshi1125hisa/.nodebrew/current/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Xamarin:Workbooks.app/Contents/SharedSupport/path-bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yoshi1125hisa/google-cloud-sdk/path.fish.inc' ]; . '/Users/yoshi1125hisa/google-cloud-sdk/path.fish.inc'; end