# verify - v1.1.109
a library for verification functions


### mflibs::verify::email()

verifies that arg1 is valid email address

#### arguments:

- $1: email

#### return codes:

- 0 valid email
- 1 invalid email
- 2 missing arguments

#### example:

```bash
if mflibs::verify::email "test@test.com"; then echo valid; fi
```

### mflibs::verify::ipv6()

verifies that arg1 is valid ipv6 address

#### arguments:

- $1: ipv6 address

#### return codes:

- 0 valid ipv6
- 1 invalid ipv6
- 2 missing arguments

#### example:

```bash
if mflibs::verify::ipv6 "2001:db8:85a3:8d3:1319:8a2e:370:7348"; then echo valid; fi
```

### mflibs::verify::ipv4()

verifies that arg1 is valid ipv4 address

#### arguments:

- $1: ipv4 address

#### return codes:

- 0 valid ipv4
- 1 invalid ipv4
- 2 missing arguments

#### example:

```bash
if mflibs::verify::ipv4 "192.168.0.1"; then echo valid; fi
```

### mflibs::verify::alpha()

verifies that arg1 is alpha

#### arguments:

- $1: string to verify

#### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

#### example:

```bash
if mflibs::verify::alpha "abc"; then echo valid; fi
```

### mflibs::verify::alpha_numeric()

verifies that arg1 is alpha-numeric

#### arguments:

- $1: string to verify

#### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

#### example:

```bash
if mflibs::verify::alpha_numeric "abc123"; then echo valid; fi
```

### mflibs::verify::numeric()

verifies that arg1 is alpha-numeric

#### arguments:

- $1: string to verify

#### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

#### example:

```bash
if mflibs::verify::numeric "123"; then echo valid; fi
```

### mflibs::verify::alpha_dash()

verifies that arg1 is alpha (with underscores/dashes)

#### arguments:

- $1: string to verify

#### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

#### example:

```bash
if mflibs::verify::alpha_dash "abc_"; then echo valid; fi
```

### mflibs::verify::version()

compares two numbers

#### arguments:

- $1: version number to verify
- $2: version number to verify

#### return codes:

- 0 equal
- 1 $1 -gt $2
- 2 $1 -lt $2
- 3 missing arguments
- 4 invalid format

#### example:

```bash
mflibs::verify::version "3.0.0" "3.0.1"
echo $?
```

### mflibs::verify::sudo()

checks if root or sudo

*function has no arguments*

#### return codes:

- 0 success
- 1 fail

#### example:

```bash
mflibs::verify::sudo
```

### mflibs::verify::command()

verifies that arg1 is a valid command

#### arguments:

- $1: command to verify

#### return codes:

- 0 command exists
- 1 command doesn't exist
- 2 missing arguments

#### example:

```bash
mflibs::verify::command "nginx"
```


