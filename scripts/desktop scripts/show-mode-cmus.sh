#!/bin/bash

CMSQ="$(cmus-remote -Q | grep 'status')"


case $1 in
  i)
    if [ -z "$CMSQ" ]; then
      echo '  ' 
    elif [ "$CMSQ" = 'status playing' ]; then
      echo '  '
    elif [ "$CMSQ" = 'status stopped' ]; then
      echo '  '
    else 
      echo '  '
    fi
  ;;
  n)
    cmus-remote -n
  ;;
  p)
    cmus-remote -r
  ;;
  s)

    if [ -z "$CMSQ" ]; then
      terminator --geometry=10x10 -e cmus -T ' CMUS PLAYER '
    else 
      cmus-remote -u
    fi
  ;;
esac
