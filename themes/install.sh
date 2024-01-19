#!/bin/bash

themes_dir="$HOME/.themes"

if [ ! -d "$themes_dir" ]; then
    mkdir -p $themes_dir
fi

if [ ! -d "$HOME/.config/gtk-4.0" ]; then
    mkdir -p $HOME/.config/gtk-4.0
fi

curl -LO "https://github.com/catppuccin/gtk/releases/download/v0.7.1/Catppuccin-Frappe-Standard-Blue-Dark.zip"
curl -LO "https://github.com/catppuccin/gtk/releases/download/v0.7.0/Catppuccin-Latte-Standard-Blue-Light.zip"
curl -LO "https://github.com/catppuccin/gtk/releases/download/v0.7.0/Catppuccin-Macchiato-Standard-Blue-Dark.zip"
curl -LO "https://github.com/catppuccin/gtk/releases/download/v0.7.0/Catppuccin-Mocha-Standard-Blue-Dark.zip"

unzip Catppuccin-Frappe-Standard-Blue-Dark.zip
unzip Catppuccin-Latte-Standard-Blue-Light.zip
unzip Catppuccin-Macchiato-Standard-Blue-Dark.zip
unzip Catppuccin-Mocha-Standard-Blue-Dark.zip

mv Catppuccin-Frappe-Standard-Blue-Dark $themes_dir 
mv Catppuccin-Latte-Standard-Blue-Light $themes_dir
mv Catppuccin-Macchiato-Standard-Blue-Dark $themes_dir
mv Catppuccin-Mocha-Standard-Blue-Dark $themes_dir

rm -rf Catppuccin-Frappe-Standard-Blue-Dark*
rm -rf Catppuccin-Latte-Standard-Blue-Light*
rm -rf Catppuccin-Macchiato-Standard-Blue-Dark*
rm -rf Catppuccin-Mocha-Standard-Blue-Dark* 

# Install to gtk-4.0
THEME_DIR="${themes_dir}/Catppuccino-Macchiato-Standard-Blue-Dark"
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

