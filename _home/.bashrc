#!/bin/bash

# Console title
TITLE="Bash"

# ANSI escape codes
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
WHITE="\033[37m"
BLACK="\033[30m"
RESET="\e[0m"

# Set title
echo -ne "\033]0;${TITLE}\007"

# Start in home directory
cd ~

# Prompt with git branch
_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\n\
\[${MAGENTA}\]\w\
\[${CYAN}\]\$(_git_branch) \
\[${YELLOW}\]\$ \
\[${RESET}\]"

# List directory alias
alias ls='ls -X --color=auto'

# List directories after changing into it
cd() {
    builtin cd "$@" && ls
}

# Recursive grep
rgrep() {
    grep -Rni --color=auto "$1" .
}

# Recursive find
rfind() {
    find . -iname "*$1*" 2>/dev/null
}

# Display current weather using wttr.in API
wttr() {
    curl -s "https://wttr.in/${1:-}?2"
}
