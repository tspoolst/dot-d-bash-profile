alias ll='ls -l'
alias la='ls -la'
alias lh='ls -l -h'
alias lt='ls -l -t'
alias l.='ls -d .*'
#function ns { netstat -nat | grep LISTEN | grep -E "^tcp(4|46)"; }
function ns { sudo lsof -Pn +M -i -cmd | grep LISTEN; }
function ifc { ifconfig | grep -e "inet " -e mtu | grep -e "inet " -B1; }
function free { vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'; }
