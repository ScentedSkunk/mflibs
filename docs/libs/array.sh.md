# array - v1.1.87
the array library handles retrieving information and manipulating information in arrays


### mflibs::array::contains()

check if item is in array

#### arguments:

- $1: needle
- $2: haystack

#### return codes:

- 0 success
- 1 no match
- 2 missing arguments

#### example:

```bash
declare -a array=("chocolate" "berries" "truffle")
mflibs::array::contains "berries" ${array[@]}
```

### mflibs::array::is_empty()

check if array is empty

#### arguments:

- $1: array to be checked

#### return codes:

- 0 empty
- 2 not empty

#### example:

```bash
declare -a array=("chocolate" "berries" "truffle")
mflibs::array::is_empty "${array[@]}"
```

### mflibs::array::glue()

join array elements with a delimiter

#### arguments:

- $1: glue
- $2: array to be glued

#### return codes:

- 0 success
- 2 missing arguments

#### example:

```bash
declare -a array=("chocolate" "berries" "truffle")
mflibs::array::glue "," "${array[@]}"
```

### mflibs::array::merge()

merge two arrays

#### arguments:

- $1: first array
- $2: second array

#### return codes:

- 0 success
- 2 missing arguments

#### example:

```bash
declare -a array=("chocolate" "berries")
declare -a array2=("apples" "banana")
mflibs::array::merge "array[@]" "array2[@]"
#example assign:
readarray -t b <<< $(mflibs::array::merge "array[@]" "array2[@]")
```


