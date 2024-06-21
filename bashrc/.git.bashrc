alias gpull='git pull'
alias gpush='git push'
alias gco='git checkout'
alias gcom='git commit -a -m '
alias gstat='git status'
alias gdif='git diff'
alias gdiff='git diff'
alias updatebranches='git fetch -p && for branch in $(git for-each-ref --format='\''%(refname) %(upstream:track)'\'' refs/heads | awk '\''$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'\''; do git branch -D $branch; done'

