# Exports
# =======

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="nano"
export VISUAL=$EDITOR
bindkey -e
export HISTFILE=~/.zsh_history
export HISTSIZE=32768
export SAVEHIST=$HISTSIZE

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages
export LESS_TERMCAP_md=$'\E[1;33m'
# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"


# Paths
# =====

typeset -U path
typeset -U manpath
fpath=("$HOME/.dotfiles/zfunctions" $fpath)
path=("$HOME/.dotfiles/bin" $path)

# Install npm packages globally without sudo
export NPM_CONFIG_PREFIX="$HOME/.npm-packages"
export N_PREFIX=$NPM_CONFIG_PREFIX
path=("$NPM_CONFIG_PREFIX/bin" $path)
manpath=("$NPM_CONFIG_PREFIX/share/man" $manpath)


# Autocomplete
# ============

# Completions from homebrew
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=("$HOME/.dotfiles/vendor/zsh-completions/src" $fpath)

autoload -Uz compinit && compinit

# Case insensitive autocomplete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
# Autocomplete grunt commands
which grunt &> /dev/null && eval "$(grunt --completion=zsh)"
# Autocomplete gulp commands
which gulp &> /dev/null && eval "$(gulp --completion=zsh)"


# Zsh options
# ===========

# Enables the delete key (reverse backspace)
bindkey '^[[3~' delete-char

# cd by 'executing' a directory
setopt auto_cd
# Command spellchecking
setopt correct
# Allow completions in both directions
setopt complete_in_word
# Extended glob features
# http://www.refining-linux.org/archives/37/ZSH-Gem-2-Extended-globbing-and-expansion/
setopt extended_glob
# Pass bad path matches to the command (fixes `git reset HEAD^` when extended_glob is enabled)
setopt no_nomatch
# Wait before executing an rm ending in * (as a warning)
setopt rm_star_wait

# Remove history duplicates
setopt hist_ignore_all_dups
# Trim whitespace from history lines
setopt hist_reduce_blanks
# Don't execute history expansion automatically
setopt hist_verify
# Share history between parallel sessions
setopt share_history


# External files
# ==============

source ~/.dotfiles/aliases.zsh
source ~/.dotfiles/functions.zsh


# Vendor
# ======

source ~/.dotfiles/vendor/z/z.sh

autoload -Uz promptinit && promptinit
prompt pure

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.dotfiles/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autoload ssh key passphrases from the keychain
ssh-add -A 2>/dev/null


# zsh-history-substring-search

source ~/.dotfiles/vendor/zsh-history-substring-search/zsh-history-substring-search.zsh

export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=black,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black,bold'

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
