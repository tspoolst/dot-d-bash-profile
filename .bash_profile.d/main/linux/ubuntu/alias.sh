function df { command df "$@" | grep -v ' /snap/' | body sort -k6; }
