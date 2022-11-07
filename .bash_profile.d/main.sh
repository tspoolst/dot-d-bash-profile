#!/bin/bash

unset ${!lc_dotdbashprofile_*}

lc_dotdbashprofile_kernelName=$(uname -s | tr A-Z a-z)
lc_dotdbashprofile_kernelName="${lc_dotdbashprofile_kernelName%%_*}"
if [[ "${lc_dotdbashprofile_kernelName}" =~ (cygwin|mingw64) ]] ; then
  lc_dotdbashprofile_subKernelPath="main/${lc_dotdbashprofile_kernelName}"
  lc_dotdbashprofile_kernelPath="main/linux"
else
  lc_dotdbashprofile_kernelPath="main/${lc_dotdbashprofile_kernelName}"
fi

for lc_dotdbashprofile_i in main ${lc_dotdbashprofile_kernelPath} ${lc_dotdbashprofile_subKernelPath} user ; do
  lc_dotdbashprofile_i=${HOME}/.bash_profile.d/${lc_dotdbashprofile_i}
  if [[ -d ${lc_dotdbashprofile_i} ]] ; then
    for lc_dotdbashprofile_j in ${lc_dotdbashprofile_i}/*.sh ; do
      [[ -s ${lc_dotdbashprofile_j} ]] && . ${lc_dotdbashprofile_j}
    done
  fi
done

unset ${!lc_dotdbashprofile_*}
