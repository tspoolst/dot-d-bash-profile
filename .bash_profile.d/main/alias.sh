alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd.='pwd'
alias cd..='cd ..'
alias cd...='cd ../..'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias lw='fn_lw'
function fn_lw {
  if which $1 >/dev/null 2>&1 ; then
    ls -l `which $1`
  else
    echo "file not found"
  fi
}
alias tree='tree -C'
alias less='less -R -M -i -C -j 10 -# 4'
alias grep='grep --color=auto'
alias sdiff='sdiff -W -w ${COLUMNS}'
alias np='nmap -sP -PE -n'
alias cleancat="grep -vE '^[[:blank:]]*(#|$)'"
