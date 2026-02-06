niri msg --json windows \
  | jaq -r '.[] | "\(.id) \(.title) - \(.app_id)"' \
  | fuzzel --dmenu -w 55 \
  | choose 0 \
  | xargs -I {} niri msg action focus-window --id {}

  # | awk '{print $1}' \
