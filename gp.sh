#!/usr/bin/env bash

pull_repo(){
  echo "-------------------------------"
  echo "Pulling "$1
  cd $HOME"$1"
  git checkout master
  git fetch --prune origin
  git pull --all
  echo "Stale local branches "$1
  git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == "[gone]" {print $1}'
  git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == "[gone]" {print $1}' | xargs -r git branch -D
}

pull_repo "/dev/cm/teamfu-alpha"
pull_repo "/dev/cm/teamfu-backend"
pull_repo "/dev/cm/teamfu-deploy"
pull_repo "/dev/cm/ionic-test"
echo "-------------------------------"
