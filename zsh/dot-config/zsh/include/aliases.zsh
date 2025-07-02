# Zsh
alias s='source ~/.config/zsh/.zshrc'

# File system
alias l='eza -lh --group-directories-first --icons=auto'
alias ll='l -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="z"

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias w='cd ~/work'
alias dot='cd ~/.dotfiles'

# Homebrew
alias bi='brew install '
alias bu='brew upgrade'
