#!/usr/bin/env bash
################################################################################
# @file_name: file
# @version: 1.1.25
# @project_name: mflibs
# @brief: a library for file functions
#
# @author: Jamie Dobbs (awildamnesiac)
# @author_contact: awildamnesiac@protonmail.ch
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2024, Jamie Dobbs
# All rights reserved.
################################################################################

################################################################################
# @description: extracts based on extension
# @example: 
#   mflibs::file::extract file.tar.gz
# @arg $1: file to extract
# @return_code: 0 success
# @return_code: 1 unable to extract
# @return_code: 2 invalid amount of arguments
# @return_code: 3 file does not exist
################################################################################
mflibs::file::extract() {
  if [[ $# -ne 1 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[2]\e[0m: ${FUNCNAME[0]} is missing arguments\n" >&2
    return 2
  fi
  if [[ ! -f "$1" ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[3]\e[0m: $1 does not exist" >&2
    return 3
  fi
  case $1 in
		*.tar | *.tar.xz | *.tar.zst) tar -xf "$1" && return 0;;
    *.tar.bz2 | *.tbz2) tar -jxf "$1" && return 0;;
    *.tar.gz | *.tgz)   tar -zxf "$1" && return 0;;
	  *.bz2) bunzip2 "$1" && return 0;;
	  *.gz) gunzip "$1" && return 0;;
		*.gpg) gpg -d "$1" | tar -xf - && return 0;;
		*.rar) 7z x "$1" && return 0;;
    *.zip) unzip -q "$1" && return 0;;
    *.7z) 7z x "$1" && return 0;;
  esac
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[1]\e[0m: unable to extract\n" >&2
  return 1
}