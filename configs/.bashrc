PATH=$PATH:$HOME
LS_COLORS="di=36;1:ln=37;1:ex=32;1"
export LS_COLORS
export PATH
export EDITOR=vim

function cdg() { ls -d */ | grep -i "$1" | awk "{printf(\"%d : %s\n\", NR, \$0)}"; read choice; if [ "$choice" == "0" ]; then : ; else cd "`ls -d */ | grep -i \"$1\" | awk \"NR==$choice\"`"; fi; }
function ? () { awk "BEGIN{ print $* }" ;}

alias gitpullsh='git pull && echo "------------------------" && git push'
alias mycomms='git logn | grep -i **edit here** | grep -i -v merge | less'
alias ls='ls -1 --color=auto'

bind '"\t":menu-complete'
shopt -s extglob
