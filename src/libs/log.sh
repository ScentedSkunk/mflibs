#!/usr/bin/env bash
################################################################################
# @file_name: log
# @version: 1.0.51
# @project_name: mflibs
# @brief: a library for logging functions
#
# @author: Jamie Dobbs (awildamnesiac)
# @author_contact: awildamnesiac@protonmail.ch
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2024, Jamie Dobbs
# All rights reserved.
################################################################################

################################################################################
# @description: initialize log library
# @return_code: 1 unable to touch log file
# @internal
################################################################################
mflibs::log::init() {
  declare mflibs_log_base;mflibs_log_base="$(dirname "$(realpath -s "${BASH_SOURCE[0]%/*}")")"; 
  [[ -z "${mflibs_log_location}" ]] && declare -g mflibs_log_location="${mflibs_log_base}/logs/${BASH_SOURCE[-1]##*/}"
  if [[ ! -d "$(dirname "${mflibs_log_location}")" ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;44minfo\e[0m: creating log location: $(dirname "${mflibs_log_location}")\n"
    mkdir -p "$(dirname "${mflibs_log_location}")"
  fi
  if [[ -f "${mflibs_log_location}" && $(wc -c "${mflibs_log_location}" | awk '{print $1}') -gt 10000 ]]; then
    [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;44minfo\e[0m: rotating ${mflibs_log_location} to ${mflibs_log_location}.1\n"
    mv -f "${mflibs_log_location}" "${mflibs_log_location}.1"
  fi
  touch "${mflibs_log_location}" || { echo -ne "\033[38;5;220merror\e[0m[1]: unable to touch ${mflibs_log_location}\n" && exit 1; }
  printf "\n### %s ###\n" "$(date "+%Y-%m-%d %R:%S")" >> "${mflibs_log_location}"
  [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;44minfo\e[0m: logging to ${mflibs_log_location}\n"
}

################################################################################
# @description: runs and logs command
# @arg 1: command to log
# @example:
#   mflibs::log "echo hi"
################################################################################
mflibs::log() {
  if [[ ! " ${MFLIBS_LOADED[*]} " =~ verbose ]]; then
    ($1 >> "${mflibs_log_location}" 2>&1)
  else
    $1 |& tee -a "${mflibs_log_location}"
  fi
}

################################################################################
# @description: runs functions in the required order
################################################################################
mflibs::log::init