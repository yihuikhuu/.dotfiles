#!/usr/bin/env bash

set -g mode-style "fg=#ffd866,bg=#403e41"

set -g message-style "fg=#ffd866,bg=#403e41"
set -g message-command-style "fg=#ffd866,bg=#403e41"

set -g pane-border-style "fg=#403e41"
set -g pane-active-border-style "fg=#ffd866"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#ffd866,bg=#19181a"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1b1d2b,bg=#ffd866,bold] #S #[fg=#ffd866,bg=#19181a,nobold,nounderscore,noitalics]"
set -g status-right ""

setw -g window-status-activity-style "underscore,fg=#6ba4f8,bg=#19181a"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#e0af68,bg=#19181a"
setw -g window-status-format "#[fg=#19181a,bg=#19181a,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#19181a,bg=#19181a,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#19181a,bg=#403e41,nobold,nounderscore,noitalics]#[fg=#ffd866,bg=#403e41,bold] #I  #W #F #[fg=#403e41,bg=#19181a,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#ffc777]#[bg=#19181a]#[fg=#19181a]#[bg=#ffc777]"
set -g @prefix_highlight_output_suffix ""
