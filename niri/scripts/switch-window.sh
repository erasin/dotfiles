niri msg --json windows \
  | jq -r '.[] | "\(.id) \(.title) - \(.app_id)"' \
  | fuzzel --dmenu -w 55 \
  | awk '{print $1}' \
  | xargs -I {} niri msg action focus-window --id {}
