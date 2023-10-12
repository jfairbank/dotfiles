#!/usr/bin/env sh

show_spotify() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_spotify_icon" "")"
  local color="$(get_tmux_option "@catppuccin_spotify_color" "$thm_orange")"
  local text="#(tmux-spotify-info)"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
