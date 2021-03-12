#!/bin/sh

# Make sure that the PATH is updated exactly once {{{1
# (like an #ifdef guard in C)
if [ -z "$PATHSET" ]
then
	export PATHSET=1
	export PATH=~/bin:~/bin/rehome:~/perl5/bin:~/.cargo/bin:~/.gem/ruby/2.7.0/bin:"$PATH"
fi
# }}}1

# Enable IBus where possible {{{1
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# }}}1

# Preferred programs {{{1
export EDITOR=vim
export BROWSER=palemoon
export MANPAGER='vim -M +MANPAGER +"setl nonumber" -'
# }}}1

# Disable gnome-keyring graphical SSH password prompts
# (see <https://askubuntu.com/a/163216/>)
unset SSH_AUTH_SOCK

export VDPAU_DRIVER=nvidia

# Fix Qt scaling issues
# (https://github.com/keepassxreboot/keepassxc/issues/5029)
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# XDG Base Directory Specification environment variables {{{1
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=~/.cache
# }}}1

# Export XDG user directories {{{1
. "$XDG_CONFIG_HOME"/user-dirs.dirs
export XDG_DESKTOP_DIR
export XDG_DOWNLOAD_DIR
export XDG_TEMPLATES_DIR
export XDG_PUBLICSHARE_DIR
export XDG_DOCUMENTS_DIR
export XDG_MUSIC_DIR
export XDG_PICTURES_DIR
export XDG_VIDEOS_DIR
# }}}1

# Make misbehaving programs put their configuration and data files in {{{1
# XDG directories

# Environment variables {{{2

# ~/.asy/
export ASYMPTOTE_HOME="$XDG_CONFIG_HOME"/asymptote/
# ~/.cargo/
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# ~/go/
export GOPATH="$XDG_DATA_HOME"/go
# ~/.ipython/
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
# ~/.Mathematica/
export MATHEMATICA_USERBASE="$XDG_DATA_HOME"/mathematica
# ~/.meteor/
export METEOR_WAREHOUSE_DIR="$XDG_DATA_HOME"/meteor
# ~/.nvm/
export NVM_DIR="$XDG_DATA_HOME"/nvm
# ~/.npmrc and ~/.npm/ (set in npmrc)
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
# ~/.sage/
export DOT_SAGE="$XDG_CONFIG_HOME"/sage
# ~/.XCompose
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/ibus/Compose
# ~/.Xauthority
export XAUTHORITY="$XDG_DATA_HOME"/X11/Xauthority
# ~/.xinitrc
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

# ~/.bash_history/
export HISTFILE="$XDG_DATA_HOME"/bash/history
# ~/.node_repl_history/
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node/repl_history
# ~/.octave_hist/
export OCTAVE_HISTFILE="$XDG_DATA_HOME"/octave/history

# ~/.vimrc and ~/.vim/ (set in vimrc)
export MYVIMRC="$XDG_CONFIG_HOME"/vim/vimrc
export VIMINIT='source $MYVIMRC'
# ~/.pentadactylrc and ~/.pentadactyl/
export PENTADACTYL_RUNTIME="$XDG_CONFIG_HOME"/pentadactyl
export MY_PENTADACTYLRC="$XDG_CONFIG_HOME"/pentadactyl/pentadactylrc
export PENTADACTYL_INIT=':source $MY_PENTADACTYLRC'
# }}}2

# Aliases {{{2

# ~/.xinitrc
alias startx='startx $XINITRC'

# }}}2

# }}}1

# ~/.lesshst
# less(1) does not need a history file.
export LESSHISTFILE=-

# Make sure ~/.xsession-errors points to /dev/null {{{1
# so that it does not grow to a huge size
# https://www.daniloaz.com/en/how-to-prevent-the-xsession-errors-file-from-growing-to-huge-size/
if [ ! -L "$HOME"/.xsession-errors ]
then
	rm -f "$HOME"/.xsession-errors
	ln -s /dev/null "$HOME"/.xsession-errors
fi
# }}}1

# vim: set fdm=marker:
