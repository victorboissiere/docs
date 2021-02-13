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

## Scripts utils

List old big size file

```bash
git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| sed -n 's/^blob //p' \
| sort --numeric-sort --key=2 \
| cut -c 1-12,41- \
| numfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
```

Remove from history

```bash
git filter-branch --tree-filter 'rm -rf node_modules' --prune-empty HEAD
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
echo node_modules/ >> .gitignore
git add .gitignore
git commit -m 'Removing node_modules from git history'
git gc
git push origin master --force
```
