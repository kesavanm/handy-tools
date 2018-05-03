#!/bin/bash
# .profile for kmuthuvel  This is specific to Work

#1 Get the aliases and functions for WORK
if [ -f ~/bin/.profile.work ]; then
	source ~/bin/.profile.work
elif [ -f /home/kmuthuvel/bin/.profile.work ]; then
    source /home/kmuthuvel/bin/.profile.work
fi

#2 Get the aliases and functions from OPEN
if [ -f ~/bin/.profile.open ]; then
	source ~/bin/.profile.open
elif [ -f /home/kmuthuvel/bin/.profile.open ]; then
    source /home/kmuthuvel/bin/.profile.open
fi

#3 Git Completion
if [ -f /home/kmuthuvel/bin/.git-completion.bash ]; then
    source /home/kmuthuvel/bin/.git-completion.bash
else
    msg2 -2 "***warning:\`git-completion\` not found***"
fi

#4 fizzy-finder
[ -f /home/kmuthuvel/.fzf.bash ] && source /home/kmuthuvel/.fzf.bash || msg2 -w "***warning:\`fzf\` not found***"
source /home/kmuthuvel/git-heart-fzf/functions.sh

#5 - misc/rest
alias   vi="/home/kmuthuvel/bin/vim"
alias  vim="/home/kmuthuvel/bin/vim"
alias  mrs="php /home/kmuthuvel/mrs.php"
alias mrbe="php /home/kmuthuvel/mrbe.php"

source /home/kmuthuvel/sonar.status

export HOUSE="__̴ı̴̴ ̡͌l̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴ ̡̡|̲͡ ̲▫̲͡ ̲͡π̲͡ ̲͡▫̲͡ ̲|̡̡ ̡ ̴̡ı̴̡ ̡͌l̡̡.___"
