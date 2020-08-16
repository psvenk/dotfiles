# dotfiles

This is mainly for my own organization, but my dotfiles are public in case they
would be useful to anyone else.

## Hard dependencies

git, POSIX sh

## Installing on a new system

```console
$ git clone https://github.com/psvenk/dotfiles
$ cd dotfiles
$ for f in $(git ls-files); do
> if [ -f "../$f" ]; then mv "../$f" "../$f.bak"; fi
> done
$ cd ..
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
