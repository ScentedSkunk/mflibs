# status - v1.0.10
a library for status handling


### mflibs::status::error()

outputs error to term

#### arguments:

- $1: error message

#### example:

```bash
mflibs::status::error "error_message" 1
```

### mflibs::status::kill()

outputs error to term and exits with provided return

#### arguments:

- $1: error message
- $2: exit code

#### example:

```bash
mflibs::status::kill "error_message" 1
```

### mflibs::status::warn()

outputs warn to term

#### arguments:

- $1: error message

#### example:

```bash
mflibs::status::warn "warning_message" 1
```

### mflibs::status::success()

outputs success to term

#### arguments:

- $1: success message

#### example:

```bash
mflibs::status::success "success_message"
```

### mflibs::status::info()

outputs info to term

#### arguments:

- $1: info message

#### example:

```bash
mflibs::status::info "info_message"
```


