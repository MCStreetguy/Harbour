#!/bin/bash

declare CONTENV_DIR="/etc/environment"
declare -a _SYSTEM_ENV=(\
  "HOME" \
  "HOSTNAME" \
  "PATH" \
  "PWD" \
  "SHLVL" \
)

if [ ! -d "$CONTENV_DIR" ]; then
  mkdir -p "$CONTENV_DIR"
fi

for ENV in "${_SYSTEM_ENV[@]}"; do
  if [ -n "$ENV" ]; then
    echo -nE "${!ENV}" > "${CONTENV_DIR}/${ENV}"
  fi
done

if [ -n "$KEEP_ENV" ]; then
  for ENV in $KEEP_ENV; do
    if [ -n "$ENV" ]; then
      echo -nE "${!ENV}" > "${CONTENV_DIR}/${ENV}"
    fi
  done
fi

unset CONTENV_DIR
unset _SYSTEM_ENV
exit 0
