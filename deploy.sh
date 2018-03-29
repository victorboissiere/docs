#!/usr/bin/env bash

set -e

mkdocs build

if ! [ $(hostname) = "victors-macbook-pro-2.home" ]; then
    echo "current branch: $TRAVIS_BRANCH"
    echo "pull request: $TRAVIS_PULL_REQUEST"
    if [[ $TRAVIS_BRANCH != 'master' || $TRAVIS_PULL_REQUEST != "false" ]]; then
      echo "only deploying on the master git branch"
      exit 0;
    fi
fi

scp -P 8923 -o StrictHostKeyChecking=no -r site/. ${VPS}

if [ $(hostname) = "victors-macbook-pro-2.home" ]; then
  terminal-notifier -title 'Done!' -message "Front deployed!" -activate 'com.apple.Terminal' -sound Ping
fi
