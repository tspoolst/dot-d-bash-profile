#!/bin/bash

for i in main main/$(uname -s) user ; do
  i=${HOME}/.bash_profile.d/${i}
  if [[ -d ${i} ]] ; then
    for j in ${i}/*.sh ; do
      [[ -s ${j} ]] && . ${j}
    done
  fi
done
