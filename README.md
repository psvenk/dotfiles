# dotfiles

This is mainly for my own organization, but my dotfiles are public in case they
would be useful to anyone else.

## Hard dependencies

git, POSIX sh

## Soft dependencies

Vim:
- Vim
- Python 3 (UltiSnips)
- Zathura (VimTeX)
- xdotool (VimTeX)

i3 window manager (X11):
- i3
- i3blocks
- i3lock-color
- dmenu-maim (includes recursive dependencies)

Sway compositor (Wayland):
- Sway
- swaybg
- swaylock-effects
- dmenu-maim (includes recursive dependencies)

## Installing on a new system

```console
$ git clone https://github.com/psvenk/dotfiles
$ cd dotfiles
$ for f in $(git ls-files); do
> if [ -f "../$f" ]; then mv "../$f" "../$f.bak"; fi
> done
$ cd ..
$ rm -rf dotfiles
$ git init
$ git remote add origin https://github.com/psvenk/dotfiles && git fetch
$ git checkout -t origin/master
$ git submodule init
$ git submodule update
$ . .profile
```

If the system is not brand new, you may want to look through the environment
variables set in `~/.profile` and move files to their new locations (e.g. `mv
~/.bash_history $HISTFILE`).

<!-- vim: set tw=80: -->
