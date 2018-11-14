# fish theme
set fish_theme yimmy

# trash command
alias rm='rmtrash'

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

# fish 
alias fish-config ".config/fish/config.fish"

# Vim
alias vi "vim"

# Docker
alias dcub "sudo docker-compose up --build"
alias dcu "sudo docker-compoase up"
alias d="sudo docker"
alias de="sudo docker exec"
alias db="sudo docker build"
alias dc="sudo docker commit"
alias di="sudo docker images"
alias dip="sudo docker inspect"
alias ds="sudo docker search"
alias dst="sudo docker stop"
alias dpl="sudo docker pull"
alias dps="sudo docker ps"
alias drm='sudo docker rm $(docker ps -aq)'
alias drmi="sudo docker rmi"
alias dv="sudo docker volume"

# docker utils
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)='\(.*\)'/\1    => \2/"| sed "s/'\\\'//g"; }

# npm
alias npm "sudo npm"

#yarn
alias yarn "sudo yarn"

