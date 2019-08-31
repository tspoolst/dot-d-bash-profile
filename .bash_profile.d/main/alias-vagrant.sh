alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vdel='vagrant destroy -f'
alias vpro='vagrant provision'
alias vssh='vagrant ssh'
alias vstat='vagrant status'
function vroot {
  typeset lc_host
  lc_host="$1"
  shift
  if [[ -n "$1" ]] ; then
    vagrant ssh ${lc_host} -c "sudo bash -c \"$@\""
  else
    vagrant ssh ${lc_host} -c "sudo bash -l"
  fi
}
