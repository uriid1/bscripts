#!/bin/env bash

cat <<EOF
------------------------------------------
 BY URIID1
 Source https://github.com/uriid1/bscripts
------------------------------------------
EOF

readonly C_RESET="\033[0m"
readonly C_INSTALL="\033[4;34m"

readonly EXIT_SUCCESS=0
readonly EXIT_FAILURE=1

for script in src/*; do
  name=$(basename $script)
  printf "Remove ~/.local/bin/${C_INSTALL}${name}${C_RESET}\n"
  rm ~/.local/bin/${name}
done
