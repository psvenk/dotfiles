# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# PS1='[\u@\h \W]\$ '

function newline_if_long_path {
	if [[ $(echo -n "$(pwd)" | wc -m) -gt 32 ]];
	then printf "\\\n";
	else printf " "; fi
}

PROMPT_COMMAND='
ORANGE="$(tput setaf 3)" CYAN="$(tput setaf 6)" \
GREEN="$(tput setaf 2)" RED="$(tput setaf 1)" RESET="$(tput sgr0)" \
PS1="[\[${ORANGE}\]\u@\h\[${CYAN}\] \
\w\[${RESET}\]]\
$(if [[ $UID -ne 0 ]]; then
echo "\[${GREEN}\]"; else echo "\[${RED}\]"; fi)\$\[${RESET}\]\
$(newline_if_long_path)"'

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|urxvt*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac
# from /etc/bash.bashrc

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export EDITOR=nano

PATH=$PATH:~/bin:~/perl5/bin:~/.cargo/bin;

PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

# Disable gnome-keyring graphical SSH password prompts
# (see <https://askubuntu.com/a/163216/>)
unset SSH_AUTH_SOCK

export VDPAU_DRIVER=nvidia

function unpushed-commits {
	git log --color origin/$1..HEAD | less -R
}
# https://stackoverflow.com/questions/2016901/viewing-unpushed-git-commits

alias update-submodules="git submodule update --recursive --remote"
# https://stackoverflow.com/questions/1030169/easy-way-to-pull-latest-of-all-git-submodules

function creation-date {
	getfattr --only-values -n system.ntfs_crtime_be "$1" |
	perl -MPOSIX -0777 -ne '$t = unpack("Q>");
	print ctime $t/10000000-11644473600'
}
# For NTFS
# https://unix.stackexchange.com/a/87275

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

pdf-grayscale() {
    gs \
      -o "${2:-$(echo $1 | sed 's/\.[^.]*$//')-grayscale.pdf}" \
      -sDEVICE=pdfwrite \
      -sColorConversionStrategy=Gray \
      -dProcessColorModel=/DeviceGray \
      -dCompatibilityLevel=1.4 \
       "$1"
}
# https://superuser.com/a/319101/

pdftopng() {
    convert -density 300 -trim "$1" -quality 100 \
      "${2:-$(echo $1 | sed 's/\.[^.]*$//').png}"
}
# https://stackoverflow.com/a/13784772/
# https://stackoverflow.com/a/6605085/

# Open a SOCKS proxy and a fresh Chromium profile
# $1: IP address to which the connection should be made
# $2: SSH port (defaults to 22)
# $3: port to use for SOCKS proxy (defaults to 4711)
socks-chromium() {
    if [ -z "$1" ]
    then
       echo No IP address provided.
       return 1
    fi
    port="${3:-4711}"
    dir="$(mktemp -dt chromium-$USER-$port-XXXXXXXXXX)"
    chromium --proxy-server="socks://localhost:$port" \
             --user-data-dir="$dir" &
    ssh -TND "$port" "$1" -p "${2:-22}"
    kill %1 2>/dev/null &
    rm -rf "$dir"
}
