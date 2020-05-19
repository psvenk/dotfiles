#!/bin/sh
export PATH=~/bin:~/perl5/bin:~/.cargo/bin:~/.gem/ruby/2.7.0/bin:$PATH

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export EDITOR=vim

# Disable gnome-keyring graphical SSH password prompts
# (see <https://askubuntu.com/a/163216/>)
unset SSH_AUTH_SOCK

export VDPAU_DRIVER=nvidia

# XDG Base Directory Specification environment variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=~/.cache

# Make misbehaving programs put their configuration files in XDG directories
export HISTFILE=$XDG_DATA_HOME/bash/history
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node/repl_history
export NVM_DIR=$XDG_DATA_HOME/nvm
export CARGO_HOME=$XDG_DATA_HOME/cargo

# less(1) does not need a history file.
export LESSHISTFILE=-
