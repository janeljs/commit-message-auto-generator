# Commit Message Auto Generator
- 알고리즘 문제 풀이 후 1초만에 커밋하기 위한 커밋 메시지 자동 생성기

## Auto Commit
### auto-commit.sh
1. 게시글의 내용에서 카테고리와 타이틀 메타 데이터를 읽어온다.
2. 현재 작업하고 있는 브랜치에서 이슈 번호를 가져온다.
3. `카테고리: (#이슈번호) 게시글 제목`의 형태로 커밋 메시지를 생성한 뒤 커밋한다.
```bash
#!/bin/bash
git add .
C=$(git diff --staged | grep category)
T=$(git diff --staged | grep title)
BRANCH=$(git branch | grep '*')
CATEGORY=${C##*:}
TITLE=${T##*:}
ISSUE=${BRANCH##*-}
MESSAGE="${CATEGORY:1}: (#${ISSUE}) ${TITLE:1}"
git commit -m "${MESSAGE}"
```
### git alias config
```bash
git config --global alias.ac '!bash auto-commit.sh'
```
## Auto Commit & Push
### auto-commit-and-push.sh
```bash
#!/bin/bash
git add .
C=$(git diff --staged | grep category)
T=$(git diff --staged | grep title)
BRANCH=$(git branch | grep '*')
CATEGORY=${C##*:}
TITLE=${T##*:}
ISSUE=${BRANCH##*-}
MESSAGE="${CATEGORY:1}: (#${ISSUE}) ${TITLE:1}"
git commit -m "${MESSAGE}"
git push origin "${BRANCH:2}":develop
```
### git alias config
```bash
git config --global alias.acp '!bash auto-commit-and-push.sh'
```