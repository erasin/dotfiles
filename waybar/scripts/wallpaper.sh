#!/bin/bash
set -e

WALLPAPER_DIR="$HOME/Pictures/wallpaper"
TRANSITION_FPS=244
TRANSITION_DURATION=1

random_wallpaper() {
    local wallpaper
    wallpaper=$(fd -a -e png -e jpg -e webp -g "*" "$WALLPAPER_DIR" | shuf -n1)
    if [[ -n "$wallpaper" ]]; then
        awww img "$wallpaper" --transition-fps="$TRANSITION_FPS" --transition-type=random --transition-duration="$TRANSITION_DURATION"
    fi
}

anyrun_wallpaper() {
    local selected
    selected=$(fd -a -e png -e jpg -e webp -g "*" "$WALLPAPER_DIR" | \
        anyrun --plugins libstdin.so --hide-icons --show-results-immediately 2>/dev/null | head -1)

    if [[ -n "$selected" ]]; then
        awww img "$selected" --transition-fps="$TRANSITION_FPS" --transition-type=random --transition-duration="$TRANSITION_DURATION"
    fi
}

case "$1" in
    random)
        random_wallpaper
        ;;
    anyrun)
        anyrun_wallpaper
        ;;
    *)
        random_wallpaper
        ;;
esac
