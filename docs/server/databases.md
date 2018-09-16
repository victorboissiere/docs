## PostgreSQL

### Shell

Check full [quick cheat](https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546)

- `\l` list tables
- `\connect database`
- `\dt` list tables

`sudo -i -u postgres`

### Create dump

```bash
pg_dump dbname > outfile
pg_dumpall > outfile
pg_dump dbname | gzip > filename.gz # Large database
```

### Restore dump

```bash
psql dbname < infile
gunzip -c filename.gz | psql dbname # Large database
```

## MongoDB

### Authentication

```javascript
use admin
db.auth('admin', 'xxx')
```

```js
db.createUser({
  user: "admin",
  pwd: "admin",
  roles: [
    {"role": "userAdminAnyDatabase", "db": "admin"},
    {"role": "dbAdminAnyDatabase", "db": "admin"},
    {"role": "readWriteAnyDatabase", "db": "admin"}
  ]
}
```

With IP restriction

```js
db.createUser({
  user: "db",
  pwd: "xxx",
  roles: [ { role: "readWrite", db: "db" }],
  authenticationRestrictions: [
    {
      clientSource: ["xxx.xxx.xxx.0/24", "127.0.0.1"]
    }
  ]
})
```

### Copy dump

```js
db.runCommand({ copydb:1, fromhost: '127.0.0.1', fromdb: 'db', todb:'db'})`
```

## ElasticSearch

**Get number of primary shards on each nodes**

```bash
curl -s elasticsearch:9200/_cat/shards?h=node,prirep | awk '
$2 == "p" {
  result[$1] += 1; total += 1
}
END {
  for (var in result)
    printf "%s\t%s (%0.2f%%)\n",var,result[var],result[var]/total*100
}'
```
