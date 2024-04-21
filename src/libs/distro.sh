#!/usr/bin/env bash
################################################################################
# @file_name: distro
# @version: 1.1.49
# @project_name: mflibs
# @brief: a library for distro related functions
#
# @author: Jamie Dobbs (awildamnesiac)
# @author_contact: awildamnesiac@protonmail.ch
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2024, Jamie Dobbs
# All rights reserved.
################################################################################

################################################################################
# @description: identify linux codename
# @example:
#   mflibs::distro::codename
# @noargs
# @return_code: 0 success
# @return_code: 1 unable to detect
################################################################################
mflibs::distro::codename() {
  declare distro_codename
  if type lsb_release >/dev/null 2>&1; then
    distro_codename=$(lsb_release -cs)
  elif [[ -f /etc/os-release ]]; then
    source "/etc/os-release"
    distro_codename="${VERSION_CODENAME}"
  elif [[ -f /etc/lsb-release ]]; then
    source /etc/lsb-release
    distro_codename="${DISTRIB_CODENAME}"
  else
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[1]\e[0m: unable to detect code name\n" >&2
    return 1
  fi
  printf -- "%s" "${distro_codename}"
}

################################################################################
# @description: identify linux version
# @noargs
# @example:
#   mflibs::distro::version
# @return_code: 0 success
# @return_code: 1 unable to detect
# @attribution: labbots, MIT
################################################################################
mflibs::distro::version() {
    declare distro_version
    if type lsb_release >/dev/null 2>&1; then
      distro_version=$(lsb_release -sr)
    elif [[ -f /etc/os-release ]]; then
      source "/etc/os-release"
      distro_version="${VERSION_ID}"
    elif [[ -f /etc/lsb-release ]]; then
      source /etc/lsb-release
      distro_version="${DISTRIB_RELEASE}"
    else
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;203m[1]\e[0m: unable to detect distro version\n" >&2
      return 1
    fi
    printf -- "%s" "${distro_version}"
}