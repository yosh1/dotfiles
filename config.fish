# fish theme
set fish_theme yimmy

# sublime command
alias sb="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# vim command
alias vi='/usr/bin/vim'

# trash command
alias rm='rmtrash'

# git command
alias ga='git add .'
alias gi='git init'
alias gpm='git push origin master'
alias gc='git commit -m'

# docker command
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

# docker-compose command
alias d-c="sudo docker-compose"

# docker-machine command
alias d-m="sudo docker-machine"

# docker utils
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)='\(.*\)'/\1    => \2/"| sed "s/'\\\'//g"; }
