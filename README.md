# dotfiles

This is mainly for my own organization, but my dotfiles are public in case they
would be useful to anyone else.

## Hard dependencies

git, POSIX sh

## Soft dependencies

Arch Linux package names follow.

Vim:
- [`gvim`][gvim]
- [`python`][python] (UltiSnips)
- [`zathura`][zathura] (VimTeX)
- [`zathura-pdf-mupdf`][zathura] (VimTeX)

General:
- [`i3blocks`][i3blocks]
	+ [`ttf-font-awesome`][ttf-font-awesome]
- [`keepmenu`][keepmenu]
- [dmenu-maim][dmenu-maim]
- [dmenu-frecency][dmenu-frecency]

Wayland-specific:
- [`sway`][sway]
- [`swaybg`][swaybg]
- [`swaylock-effects`][swaylock-effects]<sup>AUR</sup>
- wl-clipboard (vim-fakeclip)
- ydotool (keepmenu)
  + Make sure to make `/dev/uinput` writeable
- polkit-gnome

X11-specific:
- [`i3-wm`][i3-wm]
- [`i3lock-color`][i3lock-color]<sup>AUR</sup>
- [`xdotool`][xdotool] (VimTeX)

[gvim]: https://archlinux.org/packages/extra/x86_64/gvim/
[python]: https://archlinux.org/packages/core/x86_64/python/
[zathura]: https://archlinux.org/packages/community/x86_64/zathura/

[i3blocks]: https://archlinux.org/packages/community/x86_64/i3blocks/

[dmenu-maim]: https://github.com/psvenk/dmenu-maim
[dmenu-frecency]: https://github.com/psvenk/dmenu-frecency

[i3-wm]: https://archlinux.org/packages/community/x86_64/i3-wm/
[i3lock-color]: https://aur.archlinux.org/packages/i3lock-color

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
