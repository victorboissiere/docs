## Setup travis deployment

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
