# show commits in currert branch
alias gclean='git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"'
alias gd='git diff'
alias gdc='git diff --cached'
alias gsc='git log --date=format:"%Y.%m.%d_%H:%M:%S" --pretty=format:"%h - %(describe:tags) - %an, %ad -- %s"'
alias gpas="find . -name '.git'|sed -e 's/\.git$//g'|xargs -I{} sh -c 'echo -----{}; cd {}; git pull'"
alias gcas="find . -name '.git'|sed -e 's/\.git$//g'|xargs -I{} sh -c 'echo -----{}; cd {}; git st'"

alias gta='git branch -r | grep -v "\->" | (while read remote; do git branch | grep -q "${remote#origin/}$" || git branch --track "${remote#origin/}" "$remote"; done)'
alias gpa='gta;git fetch -v --all;git fetch -v --all --tags;git pull -v --all;git pull -v --all --tags'
function gca {
  (
    set -o pipefail
    if gl_clonePath=$(git clone "$@" 2>&1 | grep Cloning | grep -oE "'[^']+'") ; then
      [[ -n "$2" ]] && gl_clonePath="$2"
      cd "${gl_clonePath//\'/}"
      gpa
    fi
  )
}

alias gstat='git status'
alias gdir='git rev-parse --show-toplevel'
alias gurl='git config --get remote.origin.url'

function gtagshift {
  typeset lc_tagLatest
  lc_tagLatest=$(git tag | sort -V | tail -n 1)
  git push --delete origin ${lc_tagLatest}
  git tag -d ${lc_tagLatest}
  git tag ${lc_tagLatest}
  git push -v --tags
}
