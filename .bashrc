#!/bin/bash
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.profile

# PS1='[\u@\h \W]\$ '

newline_if_long_path() {
	if [[ $(echo -n "$(pwd)" | wc -m) -gt 32 ]];
	then printf "\\\n";
	else printf " "; fi
}

# Allow 5000 history entries (instead of 500)
export HISTSIZE=5000
export HISTFILESIZE=5000

# Append to history instead of overwriting
shopt -s histappend

PROMPT_COMMAND='
ORANGE="$(tput setaf 3)" CYAN="$(tput setaf 6)" \
GREEN="$(tput setaf 2)" RED="$(tput setaf 1)" RESET="$(tput sgr0)" \
PS1="[\[${ORANGE}\]\u@\h\[${CYAN}\] \
\w\[${RESET}\]]\
$(if [[ $UID -ne 0 ]]; then
echo "\[${GREEN}\]"; else echo "\[${RED}\]"; fi)\$\[${RESET}\]\
$(newline_if_long_path)"'

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|urxvt*|alacritty)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac
# from /etc/bash.bashrc

PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT='--install_base "'"$HOME"'/perl5"'; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

alias update-submodules="git submodule update --recursive --remote"
# https://stackoverflow.com/questions/1030169/easy-way-to-pull-latest-of-all-git-submodules

docker-removecontainers() {
    echo 'Run this command as root'
    # docker stop $(docker ps -aq)
    # docker rm $(docker ps -aq)
}

docker-armageddon() {
    echo 'Run this command as root'
    # removecontainers
    # docker network prune -f
    # docker rmi -f $(docker images --filter dangling=true -qa)
    # docker volume rm $(docker volume ls --filter dangling=true -q)
    # docker rmi -f $(docker images -qa)
}

# https://stackoverflow.com/a/42116347/

init-nvm() {
    source /usr/share/nvm/init-nvm.sh
}
