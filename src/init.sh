#!/usr/bin/env bash
################################################################################
# <START METADATA>
# @file_name: init
# @version: 1.1.379
# @project_name: mflibs
# @description: a loader for the mflibs libraries
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
# @description: checks for valid bash version and sets required variables
# @noargs
# @return_code: 1 bash version mismatch
# @internal
################################################################################
mflibs::environment::init() {
  [[ ${BASH_VERSINFO[0]} -lt 4 ]] && printf "exiting: mflibs requires bash version 4 or greater" && exit 1
  declare mflibs_base_location; declare -g mflibs_lib_location mflibs_custom_location
  mflibs_base_location="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
  mflibs_lib_location="${mflibs_base_location}/libs"
  mflibs_custom_location="${mflibs_base_location}/custom"
}

################################################################################
# @description: checks for valid libs and imports them
# @arg $1: libs to import
# @example: mflibs::import "lib1,lib2,lib3"
# @return_code: 2 lib not readable
# shellcheck disable=2068,1090
################################################################################
mflibs::import() {
  [[ $* =~ "verbose" ]] && declare -xga MFLIBS_LOADED+=("verbose") && echo -ne "\033[38;5;44minfo\e[0m: verbosity enabled\n"
  for l in ${@//,/ }; do
    [[ $l == "verbose" ]] && continue
    if [[ -f ${mflibs_lib_location}/${l}.sh ]]; then
      . "${mflibs_lib_location}/${l}.sh" 
      [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34msuccess\e[0m: loaded library \"$l\"\n"
      continue
    fi
    if [[ -f ${mflibs_custom_location}/${l}.sh ]]; then
      . "${mflibs_custom_location}/${l}.sh"
      [[ " ${MFLIBS_LOADED[*]} " =~ verbose ]] && echo -ne "\033[38;5;34msuccess\e[0m: loaded library \"$l\"\n"
      continue
    fi
    echo -ne "\033[38;5;203merror\e[0m[2]: library \"$l\" not readable\n" >&2
    #exit 2
  done
}

################################################################################
# @description: runs functions in the required order
################################################################################
mflibs::environment::init