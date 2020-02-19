#!/bin/bash
# .profile for development environment where `git` and other tools avail

HOME_ALT="$HOME"
#HOME_ALT="/home/kmuthuvel" #let others enjoy the rain ; .profile wont work on others sessions
HANDY="$HOME/handy-tools"

#1 Get the aliases and functions from OPEN
#f [ -f ~/bin/.profile.open ]; then
#   source ~/bin/.profile.open
#   msg -ng "[okay]"; echo " .profile.open loaded successfully"
#lif [ -f $HOME_ALT/bin/.profile.open ]; then
#   source $HOME_ALT/bin/.profile.open
#   msg -ng "[okay]"; echo " .profile.open (from HOME_ALT) loaded successfully"
#lse
#   msg -ne "[fail]"; echo " .profile.open load failed"
#i

#https://unix.stackexchange.com/questions/470972/printf-to-n-column
dots() {
  printf "%s" "$2"
  printf "%.0s." $(seq $(($1 - ${#2})))
}
dots_r() {
  printf "%.0s." $(seq $(($1 - ${#2})))
  printf "%s" "$2"
}

x=$(printf '%.0f\n' $(echo "$(tput cols)*.24" | bc))
y=$(printf '%.0f\n' $(echo "$(tput cols)*.56" | bc))
z=$(printf '%.0f\n' $(echo "$(tput cols)*.20" | bc))

load_script() {
  PATH_MAIN=$2;  PATH_ALT=$3
  IFS='##' read -r -a XYZ <<<$1
  if [ "${#XYZ[@]}" -ge "2" ]; then
    script="${XYZ[0]}" ; title="${XYZ[2]}"
  else
    script="${XYZ[0]}" ; title=$script
  fi

  tput sgr0
  dots $x "Checking for $title "
  SECONDS=0
  if [ -f $PATH_MAIN/$script ]; then
    source $PATH_MAIN/$script
    dots $y " loaded successfully from ($PATH_MAIN/$script) .... in $SECONDS seconds "
    dots_r $z "$(tput setaf 2)[ OK ]"
    echo
  elif [ -f $PATH_ALT/$script ]; then
    source $PATH_ALT/$script
    dots $y " loaded successfully from ($HOME_ALT/bin) .... in $SECONDS seconds"
    dots_r $z "$(tput setaf 2)[ OK ]"
    echo
  else
    dots $y " failed to load. (default path: $PATH_MAIN/$script or $PATH_ALT/$script)!please check!!!"
    dots_r $z "$(tput setaf 1)[FAIL]"
    echo
  fi
}

#3.0 Ensure submodules loaded
cd $HANDY
git submodule update --init --recursive
cd - >/dev/null

#load_script "script" "PATH_MAIN" "PATH_ALT"
load_script ".profile.open" "$HOME/bin" "$HOME_ALT/bin"                                #1 Aliases & functions from OPEN
load_script ".profile.work" "$HOME/bin" "$HOME_ALT/bin"                                #2 Aliases & functions from WORK
load_script ".git-completion.bash" "$HANDY/bin"                                        #3 Git Completion
load_script "bash_completion" "/usr/share/bash-completion"                             #4 bash_completion from the OS
load_script "git##git completion from the OS" "/usr/share/bash-completion/completions" #5 git completion from the OS
load_script ".fzf.bash##fizzy-finder" "$HOME_ALT"                                      #6 fizzy-finder
load_script "functions.sh##.git-heart-fzf" "$HANDY/git-heart-fzf"                      #7 .git-heart-fzf

#5 - misc/rest
if [ -f $HOME_ALT/bin/vim ]; then #choose user vim if so
  alias vi="$HOME_ALT/bin/vim"
  alias vim="$HOME_ALT/bin/vim"
fi

#Ubuntu 17.10 or newer, support for Wayland
xhost +SI:localuser:root

alias gvim="gvim -u ~/.gvimrc"
export HOUSE="__̴ı̴̴ ̡͌l̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴ ̡̡|̲͡ ̲▫̲͡ ̲͡π̲͡ ̲͡▫̲͡ ̲|̡̡ ̡ ̴̡ı̴̡ ̡͌l̡̡.___"
export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"

#Get into MATRIX
#/home/kmuthuvel/bin/cmatrix -s
#$(command -v cmatrix)
#loaded_open_profile ;
#show_weather ;
good_morning
#echo -ne $(cat .eye | sed  's/$/\\n/' | sed 's/ /\\a /g')

#([ -f $HOME_ALT/.fzf.bash ] && source $HOME_ALT/.fzf.bash)                              && (msg -ng "[okay]"; echo " .fzf.bash loaded successfully" ) || (msg -nw "[fail]"; echo "\`fzf\` not found...")
#([ -f $HANDY/git-heart-fzf/functions.sh ] && source $HANDY/git-heart-fzf/functions.sh)  && (msg -ng "[okay]"; echo " git-heart-fzf loaded "          ) || (msg -nw "[fail]"; echo " \`git-heart-fzf\` not found...")
