
if [[ -d ~/.bash_profile.d ]] ; then
  for i in ~/.bash_profile.d/*.sh ; do
    if [[ -s ${i} ]] ; then
      . ${i}
    fi
  done
  if [[ -d ~/.bash_profile.d/$(uname -s) ]] ; then
    for i in ~/.bash_profile.d/$(uname -s)/*.sh ; do
      if [[ -s ${i} ]] ; then
        . ${i}
      fi
    done
  fi
fi
