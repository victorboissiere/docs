## Updating gitignore

```bash
git rm -r --cached .
```

## Submodules

Fetching new repository.

`git submodule update --init`

`git pull --recurse-submodules`

## Log

Small commit sha1

```bash
git log --abbrev-commit
```

## Change commit authors

See [script](https://bitbucket.org/_Blue/config_linux/src/1ce9dc9d0dc57dab0314bc2b44e92d6f7abec3d8/.blue/scripts/git_change_commit_author.sh?at=master&fileviewer=file-view-default)

## Fetch develop branches

```bash
function fetchDevelop()
{
  for dir in ./*/; do
  cd $dir
  echo "[FETCH] $dir"
  git fetch
    if git rev-parse --verify develop; then
    git checkout develop
    git pull origin develop
    fi
  cd ../
  done
}
```
