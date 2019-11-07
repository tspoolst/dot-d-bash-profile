export HISTCONTROL=erasedups
export HISTFILESIZE=200000
export HISTSIZE=100000
alias hist='history | (while read a a;do echo "${a}";done)'
