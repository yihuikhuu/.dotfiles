#!/usr/bin/env bash

# Kanagawa Wave colors for Tmux (based on rebelot/kanagawa.nvim palette)

set -g mode-style "fg=#DCD7BA,bg=#363646"

set -g message-style "fg=#DCD7BA,bg=#363646"
set -g message-command-style "fg=#DCD7BA,bg=#363646"

set -g pane-border-style "fg=#363646" 
set -g pane-active-border-style "fg=#DCD7BA" 

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#DCD7BA,bg=#1F1F28" 

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1F1F28,bg=#DCD7BA,bold] #S #[fg=#DCD7BA,bg=#1F1F28,nobold,nounderscore,noitalics]"
set -g status-right "" 

setw -g window-status-activity-style "underscore,fg=#727169,bg=#1F1F28" 
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#727169,bg=#1F1F28" 
setw -g window-status-format "#[fg=#1F1F28,bg=#1F1F28,nobold,nounderscore,noitalics]#[default,fg=#727169,bg=#1F1F28] #I  #W #F #[fg=#1F1F28,bg=#1F1F28,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1F1F28,bg=#363646,nobold,nounderscore,noitalics]#[fg=#DCD7BA,bg=#363646,bold] #I  #W #F #[fg=#363646,bg=#1F1F28,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#FF9E3B]#[bg=#1F1F28]#[fg=#1F1F28]#[bg=#FF9E3B]" 
set -g @prefix_highlight_output_suffix ""
