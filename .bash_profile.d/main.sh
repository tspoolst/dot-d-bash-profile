#!/bin/bash

unset ${!lc_dotdbashprofile_*}

lc_dotdbashprofile_pathBase="main"

lc_dotdbashprofile_kernelName=$(uname -s | tr A-Z a-z)
lc_dotdbashprofile_kernelName="${lc_dotdbashprofile_kernelName%%_*}"
#mingw64 is most likely gitbash.
#the subKernel checks need to be refined.
if [[ "${lc_dotdbashprofile_kernelName}" =~ (cygwin|mingw64) ]] ; then
  lc_dotdbashprofile_pathKernel="${lc_dotdbashprofile_pathBase}/linux"
  lc_dotdbashprofile_pathKernelSub="${lc_dotdbashprofile_pathKernel}/${lc_dotdbashprofile_kernelName}"
elif lc_dotdbashprofile_pathKernelSub=$(uname -v | tr A-Z a-z | grep -oP '(ubuntu)') ; then
  lc_dotdbashprofile_pathKernel="${lc_dotdbashprofile_pathBase}/linux"
  lc_dotdbashprofile_pathKernelSub="${lc_dotdbashprofile_pathKernel}/${lc_dotdbashprofile_pathKernelSub}"
else
  lc_dotdbashprofile_pathKernel="${lc_dotdbashprofile_pathBase}/${lc_dotdbashprofile_kernelName}"
fi

for lc_dotdbashprofile_i in ${lc_dotdbashprofile_pathBase} ${lc_dotdbashprofile_pathKernel} ${lc_dotdbashprofile_pathKernelSub} user ; do
  lc_dotdbashprofile_i=${HOME}/.bash_profile.d/${lc_dotdbashprofile_i}
  if [[ -d ${lc_dotdbashprofile_i} ]] ; then
    for lc_dotdbashprofile_j in ${lc_dotdbashprofile_i}/*.sh ; do
      [[ -s ${lc_dotdbashprofile_j} ]] && . ${lc_dotdbashprofile_j}
    done
  fi
done

unset ${!lc_dotdbashprofile_*}
