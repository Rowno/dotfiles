# Prints a cheatsheet of all the aliases and functions
alias cheatsheet="cat ~/.dotfiles/cheatsheet.txt | less --quit-if-one-screen --chop-long-lines --no-init"

# Easier navigation: ..., ...., ..... and -
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -- -="cd -"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# ls options: Use color even with piping to awk, F = put `/` after folders, h = byte unit suffixes, color
alias ls='CLICOLOR_FORCE=1 ls -Fh ${colorflag}'

# List all files in long format
alias l="ls -l"

# List all files in long format, including dot files
alias la="ls -la"

# List only directories
alias lsd='ls -l | grep --color=never "^d"'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# IP addresses
alias ipexternal="dig +short myip.opendns.com @resolver1.opendns.com"
alias iplocal="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Checks the current Node.js project's dependencies for known security issues
alias nodesecurity="npm shrinkwrap && curl -X POST https://nodesecurity.io/validate/shrinkwrap -d @npm-shrinkwrap.json -H 'content-type: application/json'"

alias a="atom"

alias gita="git add"
alias gitch="git checkout"
alias gitco="git commit"
alias gitl="git log --oneline --decorate"
alias gits="git status"

# git root
alias gitr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# Push the current branch to origin and track it
alias gitpush='git push -u origin $(git branch | grep "\*" | cut -c 3-)'

function gitd() {
    git diff --ignore-space-change --color $@ | diff-so-fancy | less --tabs=1,5 -RFXS
}

function gitds() {
    git diff --ignore-space-change --staged --color $@ | diff-so-fancy | less --tabs=1,5 -RFXS
}

function gitsh() {
    git show --ignore-space-change --color $@ | diff-so-fancy | less --tabs=1,5 -RFXS
}

# Delete all merged branches locally and remotely
function gitprune() {
    local branches
    branches=$(git branch --merged | grep -v "\*")
    echo $branches | xargs -n 1 git branch --delete
    echo $branches | xargs -n 1 git push --delete origin
}

# Fetch a pull request to a local branch
function gitfetchpr() {
    local localBranch="${2:-$1}"
    git fetch origin pull/$1/head:$localBranch
}
