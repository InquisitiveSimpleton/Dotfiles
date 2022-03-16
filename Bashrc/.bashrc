#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


eval $(dircolors -b ~/.dir_colors)
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PS1="\n\[$(tput bold)\]\[\033[38;5;2m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;39m\]\h\[$(tput sgr0)\]:[\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;147m\]\w\[$(tput sgr0)\]] \\$\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;10m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

set -o vi
