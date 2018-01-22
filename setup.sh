#!/usr/bin/env bash

# To adapt this script to your project, do the following:
#   - vim: ESC:%s/multitor/your-project/g
#   - sed: set -i 's/multitor/your-project/g'

_arg="$1"

if [[ "$1" == "install" ]] ; then

  printf "%s\n" "Create symbolic link to /usr/local/bin"

  if [[ -e "bin/git-template-full" ]] ; then

    if [[ ! -e "/usr/local/bin/git-template-full" ]] ; then

      ln -s bin/git-template-full /usr/local/bin

    fi

  fi

  printf "%s\n" "Create man page to /usr/local/man/man8"

  if [[ -e "doc/man8/git-template-full.8" ]] ; then

    if [[ ! -e "/usr/local/man/man8/git-template-full.8.gz" ]] ; then

      cp doc/man8/git-template-full.8 /usr/local/man/man8
      gzip /usr/local/man/man8/git-template-full.8

    fi

  fi

elif [[ "$1" == "uninstall" ]] ; then

  printf "%s\n" "Remove symbolic link from /usr/local/bin"

  if [[ -L "/usr/local/bin/git-template-full" ]] ; then

    unlink /usr/local/bin/git-template-full

  fi

  printf "%s\n" "Remove man page from /usr/local/man/man8"

  if [[ -e "/usr/local/man/man8/git-template-full.8.gz" ]] ; then

    rm /usr/local/man/man8/git-template-full.8.gz

  fi

fi

exit 0

