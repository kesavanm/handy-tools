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


export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"

#echo -ne $(cat .eye | sed  's/$/\\n/' | sed 's/ /\\a /g')
