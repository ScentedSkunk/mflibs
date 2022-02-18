# file - v1.1.24
a library for file functions


### mflibs::file::extract()

extracts based on extension

#### arguments:

- $1: file to extract

#### return codes:

- 0 success
- 1 unable to extract
- 2 invalid amount of arguments
- 3 file does not exist

#### example:

```bash
mflibs::file::extract file.tar.gz
```


