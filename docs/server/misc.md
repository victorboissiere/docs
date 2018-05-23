## Byobu

aka *"Bring your own bomb"*

[Quick sheet](https://gist.github.com/inhumantsar/bf86ff1961cccdf8be06)

## Memory usage

List 10 processes that use the most memory

```bash
ps aux --sort=-%mem | awk 'NR<=10{print $0}'
```
