#!/bin/bash

sudo cp anime-cli anime-skip /usr/local/bin
sudo chmod +x /usr/local/bin/anime-cli /usr/local/bin/anime-skip
mkdir -p ~/.config/mpv/scripts
cp skip.lua ~/.config/mpv/scripts
sudo cp anime-cli.1 /usr/share/man/man1