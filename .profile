#!/bin/bash
# .profile for development environment where `git` and other tools avail

# err_report() { echo "Error on line $1"; }
# trap 'err_report $LINENO' ERR
# set -u

HOME_ALT="$HOME"
HANDY="$HOME/handy-tools"


#https://unix.stackexchange.com/questions/470972/printf-to-n-column
dots() {
  printf "%s" "$2"
  printf "%.0s." $(seq $(($1 - ${#2})))
}
dots_r() {
  printf "%.0s." $(seq $(($1 - ${#2})))
  printf "%s" "$2"
}

#TODO array for tput cols config
# if tput cols < 133 go for [0] else [1] ...

#original 24 56 20

if [ $(tput cols) -le "144"  ]; then
  ratio=(35 55 10)
else
  ratio=(40 50 10)
fi

x=$((${ratio[0]}*$(tput cols)/100))
y=$((${ratio[1]}*$(tput cols)/100))
z=$((${ratio[2]}*$(tput cols)/100))

load_script() {
  PATH_MAIN=$2;  PATH_ALT=$3
  IFS='##' read -r -a XYZ <<<$1
  if [ "${#XYZ[@]}" -ge "2" ]; then
    script="${XYZ[0]}" ; title="${XYZ[2]}"
  else
    script="${XYZ[0]}" ; title=$script
  fi

  source=""
  tput sgr0
  dots $x "loading $(tput setaf 3) $title $(tput sgr0)"
  if [ -f $PATH_MAIN/$script ]; then
    source=$PATH_MAIN/$script
  elif [ -f $PATH_ALT/$script ]; then
    source=$PATH_ALT/$script
  fi

  if [ $source ]; then
    start_time=$(date +%s.%N) #$(date +%s.%N)
    source $source ;
    end_load_time=$(date +%s.%N)
    load_time=$(echo "$end_load_time - $start_time" | bc)
    load_time=$(printf "%.2f\n" $load_time)
    dots $y " from $source in .... $(tput setaf 3)$load_time $(tput sgr0)seconds"
    dots_r $z "$(tput setaf 2)[ OK ]"
    echo
  else
    dots $y " missing ($PATH_MAIN or $PATH_ALT)!  $(tput setaf 9)please check!!!$(tput sgr0)"
    dots_r $z "$(tput setaf 1)[FAIL]"
    echo
  fi
}

# Ensure submodules loaded
cd $HANDY
git submodule update --init --recursive
cd - >/dev/null

#load_script "script" "PATH_MAIN" "PATH_ALT"
load_script ".profile.open" "$HOME/bin" "$HOME_ALT/bin"                                #1 Aliases & functions from OPEN
load_script ".profile.work" "$HOME/bin" "$HOME_ALT/bin"                                #2 Aliases & functions from WORK
load_script ".git-completion.bash" "$HANDY/bin" .                                      #3 Git Completion
load_script "bash_completion" "/usr/share/bash-completion"   .                         #4 bash_completion from the OS
load_script "git##git completion (OS)" "/usr/share/bash-completion/completions" . #5 git completion from the OS
load_script ".fzf.bash##fizzy-finder" "$HOME_ALT" .                                    #6 fizzy-finder
load_script "functions.sh##.git-heart-fzf" "$HANDY/git-heart-fzf"  .                   #7 .git-heart-fzf

# misc/rest
if [ -f $HOME_ALT/bin/vim ]; then #choose user vim if so
  alias vi="$HOME_ALT/bin/vim"
  alias vim="$HOME_ALT/bin/vim"
fi

#Ubuntu 17.10 or newer, support for Wayland
#xhost +SI:localuser:root

alias gvim="gvim -u ~/.gvimrc"
export HOUSE="__̴ı̴̴ ̡͌l̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴ ̡̡|̲͡ ̲▫̲͡ ̲͡π̲͡ ̲͡▫̲͡ ̲|̡̡ ̡ ̴̡ı̴̡ ̡͌l̡̡.___"
export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"
export SCREENDIR=$HOME/.screen

tput sgr0
#resolv
good_morning
#echo -ne $(cat .eye | sed  's/$/\\n/' | sed 's/ /\\a /g')

#([ -f $HOME_ALT/.fzf.bash ] && source $HOME_ALT/.fzf.bash)                              && (msg -ng "[okay]"; echo " .fzf.bash loaded successfully" ) || (msg -nw "[fail]"; echo "\`fzf\` not found...")
#([ -f $HANDY/git-heart-fzf/functions.sh ] && source $HANDY/git-heart-fzf/functions.sh)  && (msg -ng "[okay]"; echo " git-heart-fzf loaded "          ) || (msg -nw "[fail]"; echo " \`git-heart-fzf\` not found...")

alias csl="cowsay -n -f stegosaurus | lolcat"
#alias bat="~/bin/bat --paging=never --style='plain' --theme=TwoDark $*"
alias bat="~/bin/bat --theme=TwoDark $*"
alias poop="lolcat ~/.poop"
