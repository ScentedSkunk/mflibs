#!/usr/bin/env bash
################################################################################
# <START METADATA>
# @file_name: verify
# @version: 1.1.109
# @project_name: mflibs
# @brief: a library for verification functions
#
# @save_tasks:
#  automated_versioning: true
#  automated_documentation: true
#
# @author: Jamie Dobbs (mschf)
# @author_contact: jamie.dobbs@mschf.dev
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2022, Jamie Dobbs
# All rights reserved.
# <END METADATA>
################################################################################

################################################################################
# @description: verifies that arg1 is valid email address
# @example: 
#   if mflibs::verify::email "test@test.com"; then echo valid; fi
# @arg $1: email
# @return_code: 0 valid email
# @return_code: 1 invalid email
# @return_code: 2 missing arguments
################################################################################
mflibs::verify::email() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare email_re="^([A-Za-z]+[A-Za-z0-9]*\+?((\.|\-|\_)?[A-Za-z]+[A-Za-z0-9]*)*)@(([A-Za-z0-9]+)+((\.|\-|\_)?([A-Za-z0-9]+)+)*)+\.([A-Za-z]{2,})+$"
  if [[ $1 =~ $email_re ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 is a valid email\n"
    return 0 
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is an invalid email\n"
  return 1
}

################################################################################
# @description: verifies that arg1 is valid ipv6 address
# @example: 
#   if mflibs::verify::ipv6 "2001:db8:85a3:8d3:1319:8a2e:370:7348"; then echo valid; fi
# @arg $1: ipv6 address
# @return_code: 0 valid ipv6
# @return_code: 1 invalid ipv6
# @return_code: 2 missing arguments
################################################################################
mflibs::verify::ipv6() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare re="^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|\
([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|\
([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|\
([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|\
:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|\
::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|\
(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|\
(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$"
  if [[ "${1}" =~ $re ]];then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 is a valid ipv6 address\n"
    return 0
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is an invalid ipv6 address\n"
  return 1
}

################################################################################
# @description: verifies that arg1 is valid ipv4 address
# @example:
#   if mflibs::verify::ipv4 "192.168.0.1"; then echo valid; fi
# # output
#   valid
# @arg $1: ipv4 address
# @return_code: 0 valid ipv4
# @return_code: 1 invalid ipv4
# @return_code: 2 missing arguments
# shellcheck disable=SC2206
################################################################################
mflibs::verify::ipv4() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare verify_ip="${1}"; declare IFS=.
  declare -a ip=(${verify_ip})
  if [[ ! "${verify_ip}" =~ ^[0-9]+(\.[0-9]+){3}$ ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is an invalid ipv4 address\n"
    return 1
  fi
  declare octet
  for octet in {0..3}; do
    if [[ "${ip[$octet]}" -gt 255 ]]; then
      [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is an invalid ipv4 address\n"
      return 1
    fi
  done
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 is a valid ipv4 address\n"
  return 0
}

################################################################################
# @description: verifies that arg1 is alpha
# @example:
#   if mflibs::verify::alpha "abc"; then echo valid; fi
# # output'
#   valid
# @arg $1: string to verify
# @return_code: 0 valid input
# @return_code: 1 invalid input
# @return_code: 2 missing arguments
################################################################################
mflibs::verify::alpha() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare re='^[[:alpha:]]+$'
  if [[ "${1}" =~ $re ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 is alpha\n"
    return 0
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is not alpha\n"
  return 1
}

################################################################################
# @description: verifies that arg1 is alpha-numeric
# @example:
#   if mflibs::verify::alpha_numeric "abc123"; then echo valid; fi
# # output
#   valid
# @arg $1: string to verify
# @return_code: 0 valid input
# @return_code: 1 invalid input
# @return_code: 2 missing arguments
################################################################################
mflibs::verify::alpha_numeric() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare re='^[[:alnum:]]+$'
  if [[ "${1}" =~ $re ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 is alpha\n"
    return 0
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is not alpha\n"
  return 1
}

################################################################################
# @description: verifies that arg1 is alpha-numeric
# @example:
#   if mflibs::verify::numeric "123"; then echo valid; fi
# # output
#   valid
# @arg $1: string to verify
# @return_code: 0 valid input
# @return_code: 1 invalid input
# @return_code: 2 missing arguments
################################################################################
mflibs::verify::numeric() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  if [[ "${1}" =~ ^[0-9]+$ ]];then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 is numeric\n"
    return 0
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is not numeric\n"
  return 1
}

################################################################################
# @description: verifies that arg1 is alpha (with underscores/dashes)
# @example:
#   if mflibs::verify::alpha_dash "abc_"; then echo valid; fi
# # output
#   valid
# @arg $1: string to verify
# @return_code: 0 valid input
# @return_code: 1 invalid input
# @return_code: 2 missing arguments
################################################################################
mflibs::verify::alpha_dash() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare re='^[[:alpha:]_-]+$'
  if [[ "${1}" =~ $re ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 is alpha_dash\n"
    return 0
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: $1 is not alpha_dash\n"
  return 1
}

################################################################################
# @description: compares two numbers
# @example:
#   mflibs::verify::version "3.0.0" "3.0.1"
#   echo $?
# # output
#   2
# @arg $1: version number to verify
# @arg $2: version number to verify
# @return_code: 0 equal
# @return_code: 1 $1 -gt $2
# @return_code: 2 $1 -lt $2
# @return_code: 3 missing arguments
# @return_code: 4 invalid format
################################################################################
mflibs::verify::version() {
  if [[ $# -lt 2 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[3]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 3
  fi
    declare regex="^[.0-9]*$"
    if [[ ! $1 =~ $regex ]]; then
      [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[4]\e[0m: ${FUNCNAME[0]} $1 is in an invalid format\n" >&2
      return 4
    fi
    if [[ ! $2 =~ $regex ]]; then
      [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[4]\e[0m: ${FUNCNAME[0]} $2 is in an invalid format\n" >&2
      return 4
    fi
    if [[ "$1" == "$2" ]]; then
      [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: $1 equals $2\n"
      return 0
    fi
    declare -a ver1 ver2; declare IFS=.
    read -r -a ver1 <<<"${1}"
    read -r -a ver2 <<<"${2}"
    for ((i = ${#ver1[@]}; i < ${#ver2[@]}; i++)); do
      ver1[i]=0
    done
    for ((i = 0; i < ${#ver1[@]}; i++)); do
      [[ -z ${ver2[i]} ]] && ver2[i]=0
      if ((10#${ver1[i]} > 10#${ver2[i]})); then
        [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[1]\e[0m: $1 is greater than $2\n"
        return 1
      fi
      if ((10#${ver1[i]} < 10#${ver2[i]})); then
        [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[2]\e[0m: $1 is less than $2\n"
        return 2
      fi
    done
}

################################################################################
# @description: checks if root or sudo
# @noargs
# @example:
#   mflibs::verify::sudo
# @return_code: 0 success
# @return_code: 1 fail
################################################################################
mflibs::verify::sudo() {
  if [[ $(id -u) -ne 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[1]\e[0m: user is not root or sudo\n"
    return 1
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: user is root or sudo\n"
}

################################################################################
# @description: verifies that arg1 is a valid command
# @example:
#   mflibs::verify::command "nginx"
# @arg $1: command to verify
# @return_code: 0 command exists
# @return_code: 1 command doesn't exist
# @return_code: 2 missing arguments
################################################################################
mflibs::verify::command() {
  if [[ $# = 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  hash "${1}" 2> /dev/null
}