## Useful commands

- ++ctrl+x++ ++ctrl+e++: drop the current command into your `#!bash $EDITOR`
- `ls -<tab>`: get help for a specific command
- `cd -<tab>`: go back to previous paths

## Colors

```bash
red() { echo -e "\033[00;31m$1\033[0m"; }
green() { echo -e "\033[00;32m$1\033[0m"; }
yellow() { echo -e "\033[00;33m$1\033[0m"; }
blue() { echo -e "\033[00;34m$1\033[0m"; }
```

## Default arguments

```bash
my_func() { echo "${1:='default'}" }
 ```
