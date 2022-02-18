# dir - v1.1.36
the dir library handles directory manipulation


### mflibs::dir::mkcd()

creates and moves into directory

#### arguments:

- $1: dir

#### return codes:

- 0 success
- 1 mkdir fail
- 2 cd fail
- 3 missing arguments

#### example:

```bash
mflibs::dir::mkcd "newdir"
```


