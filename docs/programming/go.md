## Installation

```bash
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```

## Build

```bash
go build -ldflags "-s -w"
```

## Hot Reload

[Gin project](https://github.com/codegangsta/gin)

```bash
go get github.com/codegangsta/gin
$GOPATH/bin/gin run main.go
```



