#!/bin/zsh

DIR=$(dirname $(readlink -f $0))

if [[ $# -eq 0 ]]; then
  # With no args, this just displays all the contact names
  khard list -F name | tail -n +3
  exit 0;
fi

if [[ $# -eq 1 ]]; then
  # Names will just be strings, but "fields" will be `label: value`
  # Thus we want to change what we do depending, for names, we want to
  # display the contact's properties whereas for fields we want to copy
  # the contents.
  if [[ "$1" =~ ".+: .+$" ]]; then
    # Field -> copy
    result=$(echo "$1" | cut -f 2 -d ':' | sed -e 's/\s*$//' | sed -e 's/^\s*//')
    echo $result | xclip -selection clipboard >/dev/null
    exit 0
  else
    # Name -> show fields
    khard show "$( echo $1 | sed -e 's/\s*$//' )" --format yaml | ${DIR}/card_display.py
  fi
fi
