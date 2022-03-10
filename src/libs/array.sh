#!/usr/bin/env bash
################################################################################
# @file_name: array
# @version: 1.1.88
# @project_name: mflibs
# @brief: the array library handles retrieving information and manipulating information in arrays
#
# @author: Jamie Dobbs (mschf)
# @author_contact: jamie.dobbs@mschf.dev
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2022, Jamie Dobbs
# All rights reserved.
################################################################################

################################################################################
# @description: check if item is in array
# @example:
#   declare -a array=("chocolate" "berries" "truffle")
#   mflibs::array::contains "berries" ${array[@]}
# @arg $1: needle
# @arg $2: haystack
# @return_code: 0 success
# @return_code: 1 no match
# @return_code: 2 missing arguments
################################################################################
mflibs::array::contains() {
  if [[ $# -lt 2 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare mflibs_test="${1:-}"
  shift
  for i in "${@}"; do
    if [[ "${i}" == "${mflibs_test}" ]]; then
      [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: array contains $mflibs_test\n"
      return 0
    fi
  done
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[1]\e[0m: array does not contain $mflibs_test\n"
  return 1
}

################################################################################
# @description: check if array is empty
# @example:
#   declare -a array=("chocolate" "berries" "truffle")
#   mflibs::array::is_empty "${array[@]}"
# @arg $1: array to be checked
# @return_code: 0 empty
# @return_code: 2 not empty
################################################################################
mflibs::array::is_empty() {
  declare -a array=("$@")
  if [[ "${#array[@]}" -eq 0 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34m[0]\e[0m: array is empty\n"
    return 0
  fi
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;220m[2]\e[0m: array is not empty\n"
  return 2
}

################################################################################
# @description: join array elements with a delimiter
# @example:
#   declare -a array=("chocolate" "berries" "truffle")
#   mflibs::array::glue "," "${array[@]}"
# @arg $1: glue
# @arg $2: array to be glued
# @return_code: 0 success
# @return_code: 2 missing arguments
################################################################################
mflibs::array::glue() {
  if [[ $# -lt 2 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare delimiter="${1}"; shift
  printf "%s" "${1}"; shift
  printf "%s" "${@/#/${delimiter}}"
}

################################################################################
# @description: merge two arrays
# @example:
#   declare -a array=("chocolate" "berries")
#   declare -a array2=("apples" "banana")
#   mflibs::array::merge "array[@]" "array2[@]"
#   #example assign:
#   readarray -t b <<< $(mflibs::array::merge "array[@]" "array2[@]")
# @arg $1: first array
# @arg $2: second array
# @return_code: 0 success
# @return_code: 2 missing arguments
################################################################################
mflibs::array::merge() {
  if [[ $# -lt 2 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  declare -a array1=("${!1}") array2=("${!2}")
  declare -a output=("${array1[@]}" "${array2[@]}")
  printf "%s\n" "${output[@]}"
}