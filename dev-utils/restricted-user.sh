#!/bin/bash

# Pre-commit hook script: To allow only specified list of users
# to commit on the restricted branches

BRANCHES=(main) # space separated branch names
USERS=(JoeYu0524 YashP16) # space separated users
GIT_USER=$(git config --get user.name)
GIT_BRANCH=$(git branch --show-current)
if [[ ${BRANCHES[@]} =~ $GIT_BRANCH ]]
then
  if [[ ${USERS[@]} =~ $GIT_USER ]]
  then
    echo "User $GIT_USER is allowed to push"
  else
    echo "User $GIT_USER is not in the list of authorized pushers"
    exit 1
  fi
fi