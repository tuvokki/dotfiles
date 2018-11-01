alias cl='clear && date && ls -l'
alias cls='clear && date'
alias cll='clear && ls -la'

# git related
alias all='git add . && git commit -a -m '
alias merges=git log --merges --first-parent master --pretty=format:"%h %<(10,trunc)%an %<(15)%ar %s"
alias gstsh='git status --short'
alias grhhm='git reset --hard origin/master'

# development related
alias c='open_code'
alias s='yarn start'
