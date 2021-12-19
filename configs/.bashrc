# Under linux
export PS1='\[\033[01;32m\]\u@\h\[\033[37m\]:\[\033[01;33m\]\w\[\033[00m\]$(__git_ps1 " [%s]")\n\$'

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
# set -o xtrace; set +o xtrace;
function commit() { git commit -m "`tail -1 ~/TASKS | awk -F ', ' '{print $1;}'` $1"; }
function newtask() { echo ", `date "+%Y-%m-%d %H:%M"`" >> ~/TASKS; echo -n "$1" >> ~/TASKS; } 

alias ls='ls -1 --color=auto'

bind '"\t":menu-complete'
bind 'set bell-style none'
#set bell-style-visible

shopt -s extglob
shopt -s histappend histverify
shopt -s nocaseglob
shopt -s cdspell
shopt -s direxpand dirspell

# Enable the ** globstar recursive pattern in file and directory expansions.
# For example, ls **/*.txt will list all text files in the current directory hierarchy.
shopt -s globstar

# Ignore lines which begin with a <space> and match previous entries.
# Erase duplicate entries in history file.
HISTCONTROL=ignoreboth:erasedups
HISTFILESIZE=99

# Set Bash to save each command to history, right after it has been executed.
PROMPT_COMMAND='history -a'

# Invocation of z.sh copied e.g. to HOME
# https://github.com/rupa/z/blob/master/z.sh
# . ~/z.sh

function ssa() {
  eval $(ssh-agent -s)    
  #ssh-add ~/.ssh/id_rsa-...
}
