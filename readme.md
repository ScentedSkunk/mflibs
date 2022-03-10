<div id="top"></div>
  <p align="center">
    <img alt="CodeFactor Grade" src="https://img.shields.io/codefactor/grade/github/mschf-dev/mflibs?style=for-the-badge">
    <img alt ="Bash Version 4" src="https://img.shields.io/badge/BASH-4.0%2B-blueviolet?style=for-the-badge">
    <img alt="License" src="https://img.shields.io/badge/LICENSE-BSD--3--ClAUSE%2FMIT-brightgreen&?style=for-the-badge">
    <a href="https://github.com/mschf-dev/mflibs/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/mschf-dev/mflibs?style=for-the-badge"></a>
    <img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/mschf-dev/mflibs?style=for-the-badge">
    <br />
  </p>
  <div align="center">
  <p align="center">
    <a href="https://github.com/mschf-dev/mflibs/#gh-light-mode-only">
      <img src="/docs/img/logo_light.png"/>
    </a>
    <a href="https://github.com/mschf-dev/mflibs/#gh-dark-mode-only">
      <img src="/docs/img/logo_dark.png"/>
    </a>
  </p>

  <p align="center">
a bash library to make life a little bit easier
    <br />
    <a href="https://github.com/mschf-dev/iris/issues">Report Bug</a>
    ·
    <a href="https://github.com/mschf-dev/iris/issues">Request Feature</a>
    <br />
    <a href="https://mschf.dev/docs/mflibs"><strong>explore the docs</strong></a>
    <br />
    <br />
    
  </p>
</div>

<!-- table of contents --> 
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-mflibs">About mflibs</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li>
      <a href="#libraries">Libraries</a>
      <ul>
        <li><a href="#array">array</a></li>
        <li><a href="#dir">dir</a></li>
        <li><a href="#distro">distro</a></li>
        <li><a href="#file">file</a></li>
        <li><a href="#info">info</a></li>
        <li><a href="#log">log</a></li>
        <li><a href="#shell">shell</a></li>
        <li><a href="#status">status</a></li>
        <li><a href="#verify">verify</a></li>
        <li><a href="#verbose">verbose</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#authors">Authors</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT -->
## 🧐 About mflibs

**A collection of various functions and scripts for BASH 4.0 or greater:**

reduce duplicated code

add your own libraries with ease

<!-- GETTING  STARTED -->
## 🚀 Getting Started

### Prerequisites
  - git

### Installation
mfserv can be installed via a git clone:
```bash
git clone https://github.com/mschf-dev/mflibs ./opt/mflibs
```

<!-- USAGE -->
## 🎈 Usage
mflibs can be sourced by adding the following to your script:
```bash
. /path/to/mflibs/src/init
```

libraries are able to be imported by:
```bash
mflibs::import lib1,lib2
```

<!-- libraries -->
## 🗂 Libraries

<!-- array -->
### array
the array library handles retrieving information and manipulating information in arrays


#### `mflibs::array::contains()`

check if item is in array

##### arguments:

- $1: needle
- $2: haystack

##### return codes:

- 0 success
- 1 no match
- 2 missing arguments

##### example:

```bash
declare -a array=("chocolate" "berries" "truffle")
mflibs::array::contains "berries" ${array[@]}
```

#### `mflibs::array::is_empty()`

check if array is empty

##### arguments:

- $1: array to be checked

##### return codes:

- 0 empty
- 2 not empty

##### example:

```bash
declare -a array=("chocolate" "berries" "truffle")
mflibs::array::is_empty "${array[@]}"
```

#### `mflibs::array::glue()`

join array elements with a delimiter

##### arguments:

- $1: glue
- $2: array to be glued

##### return codes:

- 0 success
- 2 missing arguments

##### example:

```bash
declare -a array=("chocolate" "berries" "truffle")
mflibs::array::glue "," "${array[@]}"
```

#### `mflibs::array::merge()`

merge two arrays

##### arguments:

- $1: first array
- $2: second array

##### return codes:

- 0 success
- 2 missing arguments

##### example:

```bash
declare -a array=("chocolate" "berries")
declare -a array2=("apples" "banana")
mflibs::array::merge "array[@]" "array2[@]"
#example assign:
readarray -t b <<< $(mflibs::array::merge "array[@]" "array2[@]")
```

<!-- dir -->
### dir
the dir library handles directory manipulation


#### `mflibs::dir::mkcd()`

creates and moves into directory

##### arguments:

- $1: dir

##### return codes:

- 0 success
- 1 mkdir fail
- 2 cd fail
- 3 missing arguments

##### example:

```bash
mflibs::dir::mkcd "newdir"
```

<!-- distro -->
### distro
a library for distro related functions


#### `mflibs::distro::codename()`

identify linux codename

*function has no arguments*

##### return codes:

- 0 success
- 1 unable to detect

##### example:

```bash
mflibs::distro::codename
```

#### `mflibs::distro::version()`

identify linux version

*function has no arguments*

##### return codes:

- 0 success
- 1 unable to detect

##### example:

```bash
mflibs::distro::version
```

<!-- file-->
### file
a library for file functions


#### `mflibs::file::extract()`

extracts based on extension

##### arguments:

- $1: file to extract

##### return codes:

- 0 success
- 1 unable to extract
- 2 invalid amount of arguments
- 3 file does not exist

##### example:

```bash
mflibs::file::extract file.tar.gz
```

<!-- info -->
### info
a library for information functions


#### `mflibs::info::ipv4::dig()`

outputs IPv4 address via dig

##### return codes:

- 0 success
- 1 unable to resolve ip

##### example:

```bash
mflibs::info::ipv4::dig
```

#### `mflibs::info::ipv4::local()`

outputs local IPv4 address

##### return codes:

- 0 success
- 1 unable to resolve ip

##### example:

```bash
mflibs::info::ipv4::local
```

<!-- log -->
### log
a library for logging functions


#### `mflibs::log()`

runs and logs command

##### arguments:

- 1: command to log

##### example:

```bash
mflibs::log "echo hi"
```

<!-- shell -->
### shell
a library for shell output functions
> NOTE: ALL FUNCTIONS THAT HAVE `mflibs::shell::text` can be appended with colors: `mflibs::shell::text::white::bold` is an example

#### `mflibs::shell::misc::nl()`

outputs new line

*function has no arguments*

#### `mflibs::shell::output()`

standard shell output

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::text "hi"
```

#### `mflibs::shell::text::bold()`

bold shell output

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::text::bold "hi"
```

#### `mflibs::shell::text::underline()`

underline shell output

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::text::underline "hi"
```

#### `mflibs::shell::text::standout()`

standout shell output

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::text::standout "hi"
```

#### `mflibs::shell::icon::arrow()`

arrow shell functions

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::icon::arrow "hi"
```

#### `mflibs::shell::icon::warning()`

warning shell outputs

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::icon::warning "hi"
```

#### `mflibs::shell::icon::check()`

check shell outputs

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::icon::check "hi"
```

#### `mflibs::shell::icon::cross()`

cross shell outputs

##### arguments:

- $1: string

##### example:

```bash
mflibs::shell::icon::cross "hi"
```

<!-- status -->
### status
a library for status handling


#### `mflibs::status::error()`

outputs error to term

##### arguments:

- $1: error message

##### example:

```bash
mflibs::status::error "error_message" 1
```

#### `mflibs::status::kill()`

outputs error to term and exits with provided return

##### arguments:

- $1: error message
- $2: exit code

##### example:

```bash
mflibs::status::kill "error_message" 1
```

#### `mflibs::status::warn()`

outputs warn to term

##### arguments:

- $1: error message

##### example:

```bash
mflibs::status::warn "warning_message" 1
```

#### `mflibs::status::success()`

outputs success to term

##### arguments:

- $1: success message

##### example:

```bash
mflibs::status::success "success_message"
```

#### `mflibs::status::info()`

outputs info to term

##### arguments:

- $1: info message

##### example:

```bash
mflibs::status::info "info_message"
```

<!-- verify -->

### verify
a library for verification functions


#### `mflibs::verify::email()`

verifies that arg1 is valid email address

##### arguments:

- $1: email

##### return codes:

- 0 valid email
- 1 invalid email
- 2 missing arguments

##### example:

```bash
if mflibs::verify::email "test@test.com"; then echo valid; fi
```

#### `mflibs::verify::ipv6()`

verifies that arg1 is valid ipv6 address

##### arguments:

- $1: ipv6 address

##### return codes:

- 0 valid ipv6
- 1 invalid ipv6
- 2 missing arguments

##### example:

```bash
if mflibs::verify::ipv6 "2001:db8:85a3:8d3:1319:8a2e:370:7348"; then echo valid; fi
```

#### `mflibs::verify::ipv4()`

verifies that arg1 is valid ipv4 address

##### arguments:

- $1: ipv4 address

##### return codes:

- 0 valid ipv4
- 1 invalid ipv4
- 2 missing arguments

##### example:

```bash
if mflibs::verify::ipv4 "192.168.0.1"; then echo valid; fi
```

#### `mflibs::verify::alpha()`

verifies that arg1 is alpha

##### arguments:

- $1: string to verify

##### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

##### example:

```bash
if mflibs::verify::alpha "abc"; then echo valid; fi
```

#### `mflibs::verify::alpha_numeric()`

verifies that arg1 is alpha-numeric

##### arguments:

- $1: string to verify

##### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

##### example:

```bash
if mflibs::verify::alpha_numeric "abc123"; then echo valid; fi
```

#### `mflibs::verify::numeric()`

verifies that arg1 is alpha-numeric

##### arguments:

- $1: string to verify

##### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

##### example:

```bash
if mflibs::verify::numeric "123"; then echo valid; fi
```

#### `mflibs::verify::alpha_dash()`

verifies that arg1 is alpha (with underscores/dashes)

##### arguments:

- $1: string to verify

##### return codes:

- 0 valid input
- 1 invalid input
- 2 missing arguments

##### example:

```bash
if mflibs::verify::alpha_dash "abc_"; then echo valid; fi
```

#### `mflibs::verify::version()`

compares two numbers

##### arguments:

- $1: version number to verify
- $2: version number to verify

##### return codes:

- 0 equal
- 1 $1 -gt $2
- 2 $1 -lt $2
- 3 missing arguments
- 4 invalid format

##### example:

```bash
mflibs::verify::version "3.0.0" "3.0.1"
echo $?
```

#### `mflibs::verify::sudo()`

checks if root or sudo

*function has no arguments*

##### return codes:

- 0 success
- 1 fail

##### example:

```bash
mflibs::verify::sudo
```

#### `mflibs::verify::command()`

verifies that arg1 is a valid command

##### arguments:

- $1: command to verify

##### return codes:

- 0 command exists
- 1 command doesn't exist
- 2 missing arguments

##### example:

```bash
mflibs::verify::command "nginx"
```
<!-- verbose -->

### verbose

verbosity can be enabled on import, there are no additional commands as the libraries will output if it detects the "verbose" lib:

```bash
mflibs::import verbose
```

<!-- CONTRIBUTING -->
## 🤝 Contributing

Contributions are what make the world go around. We would love to be able to accept any new contributions, but I have not written the contribution guidelines yet.

<!-- LICENSE -->
## 📃 License

Distributed under the BSD-3-Clause License. See `license` for more information.

## ✍️ Authors
[@mschf2175](https://github.com/mschf2175) - Idea & Initial work

See the list of [contributors](https://github.com/mschf-dev/iris/contributors) who participated in this project.

<!-- ACKNOWLEDGMENTS -->
## 📣 Acknowledgements
* [bash-utility](https://github.com/labbots/bash-utility) - some functions have been used and or adapted from this github
* [shields](https://github.com/badges/shields) - A service for concise, consistent badges.
* [codefactor](https://github.com/codefactor-io) - Automated code review for GitHub.

<p align="right">(<a href="#top">back to top</a>)</p>
