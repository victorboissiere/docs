## Setup travis ssh key

Easy setup for public repository.

```bash
ssh-keygen -t rsa -b 4096 -f 'deploy_key' -N ''
# Add public key on target server
cat deploy_key.pub | pbcopy
rm 'deploy_key.pub'
travis login --org --auto
travis encrypt-file 'deploy_key'
rm 'deploy_key'
git add 'deploy_key.enc'
```

Then modify you `.travis.yml` file:

```yaml
before_install:
  - >-
    openssl aes-256-cbc
    -K $encrypted_xxxxxxxxxxxx_key
    -iv $encrypted_xxxxxxxxxxxx_iv
    -in deploy_key.enc
    -out deploy_key
    -d
  - chmod 600 deploy_key
  - eval $(ssh-agent -s)
  - ssh-add deploy_key
```

## Deployment script

Example file

```bash
#!/usr/bin/env bash

set -e

if ! [ $(hostname) = "local-hostname" ]; then
    echo "current branch: $TRAVIS_BRANCH"
    echo "pull request: $TRAVIS_PULL_REQUEST"
    if [[ $TRAVIS_BRANCH != 'master' || $TRAVIS_PULL_REQUEST != "false" ]]; then
      echo "only deploying on the master git branch"
      exit 0;
    fi
fi

# Build tasks
...

rsync --delete -e "ssh -p 22 -o StrictHostKeyChecking=no" -r site/. user@myserver:dest

if [ $(hostname) = "local-hostname" ]; then
  # Mac only
  terminal-notifier -title 'Done!' -message "Project deployed!" -activate 'com.apple.Terminal' -sound Ping
  # Linux (tested with Ubuntu)
  notify-send "Project deployed"
fi
```
