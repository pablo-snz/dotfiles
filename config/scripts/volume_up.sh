# Obtén el volumen actual
current_volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

# Define el incremento o decremento deseado
change=5  # Esto aumentará o disminuirá el volumen en un 5%

# Calcula el nuevo volumen limitado a un máximo del 150%
new_volume=$((current_volume + change))
if [ $new_volume -gt 120 ]; then
    new_volume=120
fi

# Establece el nuevo volumen
pactl set-sink-volume @DEFAULT_SINK@ ${new_volume}%

