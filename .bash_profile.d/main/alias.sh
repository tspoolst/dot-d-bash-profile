alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd.='pwd'
alias cd..='cd ..'
alias cd...='cd ../..'

alias lw='fn_lw'
# shows the full path to a executable.
function fn_lw {
  if which $1 >/dev/null 2>&1 ; then
    ls -l `which $1`
  else
    echo "file not found"
  fi
}
alias tree='tree -C'

# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}

alias less='less -R -M -i -C -j 10 -# 4'
alias grep='grep --color=auto'
alias sdiff='sdiff -W -w ${COLUMNS}'
alias np='nmap -sP -PE -n'
alias cleancat="grep -vE '^[[:blank:]]*(#|$)'"
