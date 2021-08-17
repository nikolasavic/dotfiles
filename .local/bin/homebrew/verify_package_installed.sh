#!/bin/bash
results=$(brew ls --versions $1 2>&1 1> /dev/null)

if [[ $? == 0 ]]; then
  exit 0
else
  exit 1
fi
