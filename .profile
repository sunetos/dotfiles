#!/bin/bash

# Global stuff
export PATH=$HOME/bin:$PATH
export EDITOR=vi
export CLICOLOR=1

# Homebrew stuff
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/share/npm/bin
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"

# Color stuff
eval `gdircolors ~/.dir_colors`
#alias ls='gls --color'
alias vi='vi -p'

# History stuff
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T"
shopt -s cmdhist
shopt -s histappend

# Git and other bash tweaks
alias pushd='pushd >/dev/null'
alias popd='popd >/dev/null'
pushd ~/.bash
source *.bash
popd

# VI stuff
viall() { vi **/*.$1; }
alias via='viall'
alias viapy='vi $(find . -name "*.py" | grep -v "__init__.py")'

# Python stuff
alias phttpd='python -m SimpleHTTPServer'
alias rmpyc='find . -name "*.pyc" -delete'

# Virtualenv stuff
#export PATH=/usr/local/share/python:$PATH
source /usr/local/bin/virtualenvwrapper.sh

# Nimrod stuff
export PATH=/usr/local/Cellar/nimrod/0.9.2/libexec/bin:$PATH

# Julia stuff
export PATH=/Applications/Julia-0.3.0-prerelease.app/Contents/Resources/julia/bin:$PATH


# SCM Breeze stuff
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

function ssh-copy-id-mac() { #mac version of ssh-copy-id
  #from https://discussions.apple.com/message/13166537#13166537
  if [[ ! -n "$1" ]] ; then
    echo 1>&2 Usage: $0 user@server
  else
    cat ~/.ssh/id_rsa.pub | ssh $1 "umask 077; mkdir -p .ssh ; cat >> .ssh/authorized_keys2"
  fi
}

# Ruby stuff
#eval "$(rbenv init -)"

export PATH=/Users/adam/bin/Sencha/Cmd/4.0.2.67:$PATH
