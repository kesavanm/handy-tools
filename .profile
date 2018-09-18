#!/bin/bash
# .profile for kmuthuvel  This is specific to Work

HOME_ALT="/home/kmuthuvel"

#1 Get the aliases and functions for WORK
if [ -f ~/bin/.profile.work ]; then
	source ~/bin/.profile.work
elif [ -f $HOME_ALT/bin/.profile.work ]; then
    source $HOME_ALT/bin/.profile.work
fi

#2 Get the aliases and functions from OPEN
if [ -f ~/bin/.profile.open ]; then
	source ~/bin/.profile.open
elif [ -f $HOME_ALT/bin/.profile.open ]; then
    source $HOME_ALT/bin/.profile.open
fi

#3 Git Completion
if [ -f $HOME_ALT/bin/.git-completion.bash ]; then
    source $HOME_ALT/bin/.git-completion.bash
else
    msg2 -2 "***warning:\`git-completion\` not found***"
fi

#4 fizzy-finder
[ -f $HOME_ALT/.fzf.bash ] && source $HOME_ALT/.fzf.bash || msg2 -w "***warning:\`fzf\` not found***"
source $HOME_ALT/git-heart-fzf/functions.sh

#5 - misc/rest
alias   vi="$HOME_ALT/bin/vim"
alias  vim="$HOME_ALT/bin/vim"
alias gvim="gvim -u ~/.gvimrc"
export HOUSE="__̴ı̴̴ ̡͌l̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴ ̡̡|̲͡ ̲▫̲͡ ̲͡π̲͡ ̲͡▫̲͡ ̲|̡̡ ̡ ̴̡ı̴̡ ̡͌l̡̡.___"

alias  mrs="php $HOME_ALT/mrs.php"
alias mrbe="php $HOME_ALT/mrbe.php"
source $HOME_ALT/sonar.status

