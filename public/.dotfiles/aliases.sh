#!/usr/bin/env bash

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

# `cat` with beautiful colors. requires Pygments installed.
#                              sudo easy_install -U Pygments
#                              sudo apt-get install python-pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Update installed npm packages and Ruby gems
alias update='sudo npm update -g; sudo gem update'

# IP addresses
alias ipexternal="dig +short myip.opendns.com @resolver1.opendns.com"
alias iplocal="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# SSH tunnel
alias tunnel='sshuttle --daemon --pidfile=/tmp/sshuttle.pid --remote vps --dns 0/0'
alias tunnelstop='[[ -f /tmp/sshuttle.pid ]] && kill `cat /tmp/sshuttle.pid`'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Checks the current Node.js project's dependencies for known security issues
alias nodesecurity="npm shrinkwrap && curl -X POST https://nodesecurity.io/validate/shrinkwrap -d @npm-shrinkwrap.json -H 'content-type: application/json'"

alias gitd="git diff --ignore-space-change"
alias gitds="git diff --ignore-space-change --staged"
alias gita="git add"
alias gitl="git log --oneline --decorate"
alias gits="git status"

# git root
alias gitr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# Delete all merged branches locally and remotely
function gitprune() {
    local branches=$(git branch --merged | grep -v "\*")
    echo $branches | xargs -n 1 git branch --delete
    echo $branches | xargs -n 1 git push --delete origin
}

# Push the current branch to origin and track it
function gitpush() {
    local branch=$(git branch | grep "\*" | cut -c 3-)
    git push -u origin $branch
}

# Fetch a pull request to a local branch
function gitfetchpr() {
    local localBranch="${2:-$1}"
    git fetch origin pull/$1/head:$localBranch
}

# Ignore changes on a tracked file
alias gitignore="git update-index --assume-unchanged"

# Stop ignoring changes on a tracked file
alias gitunignore="git update-index --no-assume-unchanged"

# List tracked files set to ignore changes
alias gitignored="git ls-files -v | grep '^[a-z]'"
