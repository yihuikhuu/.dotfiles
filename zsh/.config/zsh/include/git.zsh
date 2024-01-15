# Basic functions
alias gs='git status'
alias gpull='git pull'
alias gpush='git push'
alias gd='git diff'
alias gpr='git pull --rebase'

# Adding helpers
alias gadd='git add .'
alias gca='git add . && git commit -av'

# Logging helpers
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

# Branch helpers
__new_branch() { git checkout -b $1 }
alias gbn=__new_branch

# Switching contexts
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "wip: $(date)"'

alias gundo='git reset HEAD~'
