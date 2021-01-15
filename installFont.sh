#!/bin/bash

# Run as sudo
git clone https://github.com/Znuff/consolas-powerline
cd -v consolas-powerline
rm -rfv .git
rm -v README.md
cp -v * /usr/share/fonts/
