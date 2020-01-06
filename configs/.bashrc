export PS1='\[\033[01;32m\]\u@\h\[\033[37m\]:\[\033[01;33m\]\w\[\033[00m\]$(__git_ps1 " [%s]") \$ '

PATH=$PATH:$HOME
LS_COLORS="di=36;1:ln=37;1:ex=32;1"
export LS_COLORS
export PATH
export EDITOR=vim
export TSC_WATCHFILE=UseFsEventsWithFallbackDynamicPolling

# Quiet for WSL
export LESS="$LESS -R -Q"

function cdg() { ls -d */ | grep -i "$1" | awk "{printf(\"%d : %s\n\", NR, \$0)}"; read choice; if [ "$choice" == "0" ]; then : ; else cd "`ls -d */ | grep -i \"$1\" | awk \"NR==$choice\"`"; fi; }
function fs() { echo -n $1 | sed 's/\\/\//g' }

alias ls='ls -1 --color=auto'
bind '"\t":menu-complete'
shopt -s extglob

# Invocation of z.sh copied e.g. to HOME
# https://github.com/rupa/z/blob/master/z.sh
# . ~/z.sh

function ssa() {
  eval $(ssh-agent -s)    
  #ssh-add ~/.ssh/id_rsa-...
}