# Commit Message Auto Generator
- 알고리즘 문제 풀이 후 1초만에 커밋하기 위한 커밋 메시지 자동 생성기


## Script
```bash
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
```

## Git Alias
```bash
git config --global alias.acp '!bash auto-commit-and-push.sh'
```