#!/bin/bash
git add .
C=$(git diff --staged | grep category)
T=$(git diff --staged | grep title)
I=$(git branch | grep '*')
CATEGORY=${C##*:}
TITLE=${T##*:}
ISSUE=${I##*-}
MESSAGE="${CATEGORY:1}: (#${ISSUE}) ${TITLE:1}"
git commit -m "${MESSAGE}"