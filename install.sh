#!/bin/bash

function contains() {
  [[ $1 =~ (^|[[:space:]])"$2"($|[[:space:]]) ]]
}

abspath() {
  if [ -d "$1" ]; then
    cd "$1"; pwd
  else
    fname=`basename "$1"`
    cd `dirname "$1"`
    echo "`pwd`/$fname"
  fi
}

relpath() {
  source=`abspath $1`
  target=`abspath $2`
  common_part=$source
  back=
  while [ "${target#$common_part}" = "${target}" ]; do
    echo "common_part $common_part"
    common_part=$(dirname $common_part)
    back="../${back}"
  done
  echo ${back}${target#$common_part/}
}

shopt -s dotglob  # Include hidden files (starting with .)
SELF=`basename $0`
DIR=`pwd`

pushd ~ > /dev/null
for file in $DIR/*; do
  contains "$SELF .git" "`basename $file`" && continue
  echo "Creating link for '`basename $file`'."
  ln -s `relpath . $file` `basename $file`
done
popd ~ > /dev/null
