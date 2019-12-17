function dclean {
  docker ps -a | grep -e Exited -e Created | (while read a b;do docker rm $a;done)
  docker images | grep "^<none>" | (while read a a a b;do docker rmi $a;done)
  docker image prune -f
}
