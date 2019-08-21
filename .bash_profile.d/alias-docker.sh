function dclean {
  docker ps -a | grep Exited | (while read a b;do docker rm $a;done)
  docker images | grep "^<none>" | (while read a a a b;do docker rmi $a;done)
}
