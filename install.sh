#!/bin/env bash

cat <<EOF
------------------------------------------
 BY URIID1
 Source https://github.com/uriid1/bscripts
------------------------------------------
EOF

readonly C_RESET="\033[0m"
readonly C_ERROR="\033[1;31m"
readonly C_INFO="\033[1;32m"
readonly C_INSTALL="\033[4;34m"

readonly EXIT_SUCCESS=0
readonly EXIT_FAILURE=1

warn() {
  printf "Warning ${1} ${C_ERROR}not found${C_RESET}\n"
}

install() {
  printf "Install ${C_INSTALL}${1}${C_RESET}...\n"
}

basic_programs=(adb dig iptables wc sysctl wget python bc readlink lsblk column)
for ((i = 0; i < ${#basic_programs[*]}; ++i)); do
  programm="${basic_programs[$i]}"

  if ! [ "$(which -a $programm . 2>/dev/null)" ]; then
    warn "${programm}"
  fi
done

if ! echo "${PATH}" | grep -q "${HOME}/.local/bin"; then
  echo "By default, scripts are placed in the directory ${HOME}/.local/bin"
  echo "But in your \$PATH variable set in env, this path is not included."
  echo "Set it manually, for example, if you are using bash -"
  echo "add the line export PATH=\"\$PATH:~/.local/bin\" to ~/.bashrc"
  exit $EXIT_FAILURE
fi

chmod +x src/*
for script in src/*; do
  name=$(basename $script)
  printf "Copy ${C_INSTALL}${name}${C_RESET} to ~/.local/bin/${name}\n"
  cp $script ~/.local/bin/
done
