#!/bin/bash
# .profile for kmuthuvel  This is specific to Work

#1 Get the aliases and functions for WORK
if [ -f ~/bin/.profile.de ]; then
	source ~/bin/.profile.de
elif [ -f /home/kmuthuvel/bin/.profile.de ]; then
        source /home/kmuthuvel/bin/.profile.de
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
fi

#4 fizzy-finder
[ -f /home/kmuthuvel/.fzf.bash ] && source /home/kmuthuvel/.fzf.bash
source /home/kmuthuvel/git-heart-fzf/functions.sh
alias fzf="/home/kmuthuvel/.fzf/bin/fzf"
alias fz="fzf --preview 'cat {} 2> /dev/null | head -50'"
alias fz2="fzf --height 40% --reverse --preview 'file {}' --preview-window down:1"

#5 - misc/rest
alias vi="/home/kmuthuvel/bin/vim"
alias vim="/home/kmuthuvel/bin/vim"
alias mrs="php /home/kmuthuvel/mrs.php"
alias mrbe="php /home/kmuthuvel/mrbe.php"

source /home/kmuthuvel/x.sh



