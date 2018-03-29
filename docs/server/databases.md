hero: Databases cheat sheet

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
