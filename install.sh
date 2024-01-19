#!/bin/bash 

wm="sway"
packer="pacman"

if [ ! "$(basename $SHELL)" = "zsh" ]; then
    echo "This script is only for zsh."
    exit 1
fi

# read -p "Which window manager do you use? ([s]way, [n]one, default: none): "  -n 1 -r
# echo ""
# case $REPLY in
#     s) wm="sway";;
#     *) echo "This script is only for window manager listed above." && exit 1;;
# esac
#
# read -p "Which is your package manager? ([p]acman, [n]one, default: none): "  -n 1 -r
# echo ""
# case $REPLY in
#     p) packer="pacman";;
#     *) echo "Only works for package manager listed above."  && exit 1;;
# esac

# Install packages
echo "Installing packages..."
if [ "$packer" = "pacman" ]; then
    sudo pacman -S $(./packages/merge.sh $wm $packer)
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# Install pyenv
if [ ! -d "$HOME/.pyenv" ]; then
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
fi

# Install nvm
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi 

# Install node and npm
if [ ! -d "$HOME/.nvm/versions/node/v14.17.3" ]; then
    echo "Installing node..."
    source $HOME/.zshrc 
    nvm install latest
fi

# clone dotfiles
cp -r config/* $HOME/.config/
cp -r zshenv $HOME/.zshenv
cp -r local/share/rofi/themes $HOME/.local/share/rofi/themes
cp -r Pictures/* $HOME/Pictures/

# Manual fixes:
# - Add import in alacritty.toml for colorscheme
import_line="import = [\"{$HOME}/.config/alacritty/colors.toml\"]"
sed -i "s/import = \[\]/$import_line/g" $HOME/.config/alacritty/alacritty.toml

# Install icons: Kora light
if [ ! -d "$HOME/.local/share/icons/kora-light"]; then
    echo "Installing kora light icons..."
    chmod +x icons/install.sh
    ./icons/install.sh
fi

# Install Themes
echo "Installing themes..."
chmod +x themes/install.sh
./themes/install.sh


# Install fonts
echo "Installing fonts..."
chmod +x fonts/install.sh
./fonts/install.sh
