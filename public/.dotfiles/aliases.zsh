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

# Always enable colored `grep` output
alias grep='grep --color=auto'

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

alias c="code"

alias dc="docker-compose"

# Lists all processes with open ports matching the given regex
alias open-ports='lsof -Pn -i4 -i6 | grep LISTEN | grep'

alias gita="git add"
alias gitch="git checkout"
alias gitco="git commit"
alias gitl="git log --pretty=format:'%C(auto)%h  %<(16)%ad %d %s%C(reset)'"
alias gits="git status"
alias gitbd="git branch -d"
alias gitm="git merge --no-edit"

# git root
alias gitr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

function gitd() {
  git diff --ignore-space-change --color $@ | diff-so-fancy | less --tabs=2 --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --chop-long-lines
}

function gitds() {
  git diff --ignore-space-change --staged --color $@ | diff-so-fancy | less --tabs=2 --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --chop-long-lines
}

function gitsh() {
  git show --ignore-space-change --color $@ | diff-so-fancy | less --tabs=2 --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --chop-long-lines
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
