Configuration files
===================

Tested only on Arch-based distros. Use [stow](https://www.gnu.org/software/stow/manual/stow.html) to create the symlinks and apply the configs.

Consolas font
-------------

The consolas font can be found [here](https://github.com/Znuff/consolas-powerline) copy the contents to `/usr/share/fonts/`. The script below should install the font if run as sudo:

```
#!/bin/bash

git clone https://github.com/Znuff/consolas-powerline
cd -v consolas-powerline
rm -rfv .git
rm -v README.md
cp -v * /usr/share/fonts/
```

Required software
-----------------

The required software to use the config files and my personal setup is listed in the `installListPacman` and `installListParu` files. To install directly with `pacman` use:

```
pacman -Suy - << installListPacman
paru -Suy . << installListParu
```

Para los widgets de awesome buscar awesome wm widgets

## Install virtual desktop bar for Plasma

```
paru -Suy plasma5-applets-virtual-desktop-bar-git
```

## Set github to work with token

```
git remote set-url origin https://scuzzlebuzzle:<MYTOKEN>@github.com/scuzzlebuzzle/ol3-1.git
```

asd
