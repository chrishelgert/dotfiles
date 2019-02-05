#!/usr/bin/env bash

function changeLayout {
  if [ "$1" == "both" ]; then
    echo "both"
    # sh "./both.sh"
  else
    echo "laptop"
    # sh "./laptop.sh"
  fi
}

