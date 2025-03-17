niri msg --json focused-window | jq -r '.id' | xargs -I {} niri msg action close-window --id {}
