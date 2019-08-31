# dot-d-bash-profile
.d style bash profile works with darwin (aka. macos), linux, and others if you create a directory to match your "uname -s" entry.

##install
ln -s <your path to>/dot-d-bash-profile/.bash_profile.d ${HOME}/
add the line
  ". .bash_profile.d/main.sh"
to the bottom of your .bash_profile

##private stuff
put those files in .bash_profile.d/user/ and they will be ignored by git.
