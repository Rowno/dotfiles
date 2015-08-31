export EDITOR="nano"
export VISUAL=$EDITOR
bindkey -e
export HISTFILE=~/.histfile
export HISTSIZE=32768
export SAVEHIST=$HISTSIZE

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages
export LESS_TERMCAP_md=$'\E[1;33m'
# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"


typeset -U path
typeset -U manpath
typeset -UT NODE_PATH nodepath
fpath=("$HOME/.dotfiles/zfunctions" $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)
path=("$HOME/bin" $path)

# Install npm packages globally without sudo
export npm_config_prefix="$HOME/.npm-packages"
export N_PREFIX=$npm_config_prefix
path=("$npm_config_prefix/bin" $path)
manpath=("$npm_config_prefix/share/man" $manpath)
nodepath=("$npm_config_prefix/lib/node_modules" $nodepath)


autoload -Uz compinit
compinit


# Search history for partially entered command using up and down keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Allows parallel zsh sessions to save history without overriding each other
setopt append_history
# cd by 'executing' a directory
setopt auto_cd
# Terminal beeps
setopt beep
# Command spellchecking
setopt correct
# Extended glob features
# http://www.refining-linux.org/archives/37/ZSH-Gem-2-Extended-globbing-and-expansion/
setopt extended_glob
# Remove history duplicates
setopt hist_ignore_all_dups
# Error when a glob doesn't match
setopt nomatch
# Prevent exiting background tasks from messing up the terminal
setopt notify
# Wait before executing an rm ending in * (as a warning)
setopt rm_star_wait


source ~/.dotfiles/vendor/z/z.sh
autoload -U promptinit && promptinit
prompt pure
