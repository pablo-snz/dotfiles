#!/bin/bash

fonts_dir="/usr/share/fonts"
current=pwd

cd $fonts_dir

# Install Nerd Fonts
# JetBrain Mono
curl -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
unzip JetBrainsMono.zip
rm -rf JetBrainsMono.zip

# Symbols
curl -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip"
unzip NerdFontsSymbolsOnly.zip
rm -rf NerdFontsSymbolsOnly.zip

# Fira Code
curl -LO "https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip"
unzip Fira_Code_v6.2.zip
rm -rf Fira_Code_v6.2.zip

fc-cache -fv 

cd $current
