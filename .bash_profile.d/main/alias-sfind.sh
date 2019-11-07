function sfind {
  if [[ -z "$3" ]] ; then
    echo "string find"
    echo "searches a path for a string in a commonly named file i.e. 'Vagrantfile' or '.gitignore'"
    echo "usage $0 <path> <file> <search_string>" >&2
    return 1
  fi
  typeset lc_path lc_file lc_string
  lc_path="$1"
  lc_file="$2"
  lc_string="$3"
  find "${lc_path}" \
      -name "${lc_file}" | \
    ( while read i;do
        eval "grep -lE '${lc_string}' \"\${i}\" && grep -nE '${lc_string}' \"\${i}\""
      done
    )
}
