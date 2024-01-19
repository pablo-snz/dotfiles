# Alacritty
cp $HOME/.config/themes/$1/alacritty.toml $HOME/.config/alacritty/colors.toml
# Neovim
sed -i 's/flavour = "[^"]*", -- latte, frappe, macchiato, mocha/flavour = "'$1'", -- latte, frappe, macchiato, mocha/' $HOME/.config/nvim/lua/packer/catppuccin.lua
# Foot
cp $HOME/.config/themes/$1/foot.ini $HOME/.config/foot/foot.ini
# Sway
cp $HOME/.config/themes/$1/sway $HOME/.config/sway/themes/colors
# Waybar
cp $HOME/.config/themes/$1/waybar.css $HOME/.config/waybar/colors.css
# Mako
cp $HOME/.config/themes/$1/mako $HOME/.config/mako/config
# GTK
if [ $1 eq "latte"] then
    THEME_NAME="Catppuccino-Latte-Standard-Blue-Light"
elif [ $1 eq "frappe"] then
    THEME_NAME="Catppuccino-Frappe-Standard-Blue-Dark"
elif [ $1 eq "macchiato"] then
    THEME_NAME="Catppuccino-Macchiato-Standard-Blue-Dark"
elif [ $1 eq "mocha"] then
    THEME_NAME="Catppuccino-Mocha-Standard-Blue-Dark"
fi
sed -i 's/.*gtk-theme-name=.*/gtk-theme-name='$THEME_NAME'/' $HOME/.config/gtk-3.0/settings.ini
THEME_DIR="${HOME}/.themes/${THEME_NAME}"
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# Rofi
cp $HOME/.config/themes/$1/rofi.rasi $HOME/.local/share/rofi/themes/theme.rasi

# Set actual theme
echo $1 > $HOME/.config/themes/current_theme
