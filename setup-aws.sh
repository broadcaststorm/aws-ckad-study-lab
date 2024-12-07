#!/usr/bin/env bash

if test -z "${SECURE}"; then
   echo "You must first defined the SECURE var for your setup"
else
   source ${SECURE}/aws-ckad-study-lab
fi
