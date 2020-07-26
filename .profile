#!/bin/sh

# Make sure that the PATH is updated exactly once (like an #ifdef guard in C)
if [ -z "$PATHSET" ]
then
	export PATHSET=1
	export PATH=~/bin:~/bin/rehome:~/perl5/bin:~/.cargo/bin:~/.gem/ruby/2.7.0/bin:$PATH
fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export EDITOR=vim
export BROWSER=palemoon

# Disable gnome-keyring graphical SSH password prompts
# (see <https://askubuntu.com/a/163216/>)
unset SSH_AUTH_SOCK

export VDPAU_DRIVER=nvidia

# Fix Qt scaling issues
# (https://github.com/keepassxreboot/keepassxc/issues/5029)
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# XDG Base Directory Specification environment variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=~/.cache

# Export XDG user directories
. $XDG_CONFIG_HOME/user-dirs.dirs
export XDG_DESKTOP_DIR
export XDG_DOWNLOAD_DIR
export XDG_TEMPLATES_DIR
export XDG_PUBLICSHARE_DIR
export XDG_DOCUMENTS_DIR
export XDG_MUSIC_DIR
export XDG_PICTURES_DIR
export XDG_VIDEOS_DIR

# Make misbehaving programs put their configuration and data files in
# XDG directories

# ~/.bash_history/
export HISTFILE=$XDG_DATA_HOME/bash/history
# ~/.node_repl_history/
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node/repl_history
# ~/.octave_hist/
export OCTAVE_HISTFILE=$XDG_DATA_HOME/octave/history

# ~/.nvm/
export NVM_DIR=$XDG_DATA_HOME/nvm
# ~/.cargo/
export CARGO_HOME=$XDG_DATA_HOME/cargo
# ~/.npmrc and ~/.npm/ (set in npmrc)
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# ~/.asy/
export ASYMPTOTE_HOME=$XDG_CONFIG_HOME/asymptote/
# ~/.XCompose
export XCOMPOSEFILE=$XDG_CONFIG_HOME/ibus/Compose
# ~/.Xauthority
export XAUTHORITY=$XDG_DATA_HOME/X11/Xauthority
# ~/.xinitrc
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

# ~/.vimrc and ~/.vim/ (set in vimrc)
export MYVIMRC=$XDG_CONFIG_HOME/vim/vimrc
export VIMINIT='source $MYVIMRC'
# ~/.pentadactylrc and ~/.pentadactyl/
export PENTADACTYL_RUNTIME=$XDG_CONFIG_HOME/pentadactyl
export MY_PENTADACTYLRC=$XDG_CONFIG_HOME/pentadactyl/pentadactylrc
export PENTADACTYL_INIT=':source $MY_PENTADACTYLRC'

# ~/.xinitrc
alias startx='startx $XINITRC'

# ~/.lesshst
# less(1) does not need a history file.
export LESSHISTFILE=-

# Use vi/less keybindings for GNU Info
alias info='info --vi-keys'

# Make sure ~/.xsession-errors points to /dev/null so that it does not grow to
# a huge size
# https://www.daniloaz.com/en/how-to-prevent-the-xsession-errors-file-from-growing-to-huge-size/
if [ ! -L $HOME/.xsession-errors ]
then
	rm -f $HOME/.xsession-errors
	ln -s /dev/null $HOME/.xsession-errors
fi
