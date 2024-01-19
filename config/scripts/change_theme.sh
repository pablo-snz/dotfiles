#!/bin/bash

case "$1" in
  mocha|macchiato|frappe|latte)
    echo "Cambiando tema a $1 ..."
    bash $HOME/.config/themes/themes.sh $1
    makoctl reload
    clear
    swaymsg reload
    clear
    ;;
  *)
    if [ -z "$1" ]; then
      echo "Argumentos válidos: {mocha|macchiato|frappe|latte}"
      echo "Current theme: $(cat $HOME/.config/themes/current_theme)"
      echo ""
    else
      echo "Argumento no válido: $1"
    fi
    exit 1
    ;;
esac

