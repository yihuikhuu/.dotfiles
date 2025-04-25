#!/usr/bin/env bash

# Catppuccin colors for Tmux

set -g mode-style "fg=#89b4fa,bg=#585b70"

set -g message-style "fg=#89b4fa,bg=#585b70"
set -g message-command-style "fg=#89b4fa,bg=#585b70"

set -g pane-border-style "fg=#585b70"
set -g pane-active-border-style "fg=#89b4fa"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#89b4fa,bg=#1e1e2e"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1e1e2e,bg=#89b4fa,bold] #S #[fg=#89b4fa,bg=#1e1e2e,nobold,nounderscore,noitalics]"
set -g status-right ""

setw -g window-status-activity-style "underscore,fg=#89b4fa,bg=#1e1e2e"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#cdd6f4,bg=#1e1e2e"
setw -g window-status-format "#[fg=#1e1e2e,bg=#1e1e2e,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1e1e2e,bg=#1e1e2e,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1e1e2e,bg=#363a4f,nobold,nounderscore,noitalics]#[fg=#89b4fa,bg=#363a4f,bold] #I  #W #F #[fg=#363a4f,bg=#1e1e2e,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#f9e2af]#[bg=#1e1e2e]#[fg=#1e1e2e]#[bg=#f9e2af]"
set -g @prefix_highlight_output_suffix ""
