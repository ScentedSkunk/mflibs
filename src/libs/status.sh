#!/usr/bin/env bash
################################################################################
# @file_name: status
# @version: 1.0.11
# @project_name: mflibs
# @brief: a library for status handling
#
# @author: Jamie Dobbs (awildamnesiac)
# @author_contact: awildamnesiac@protonmail.ch
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2024, Jamie Dobbs
# All rights reserved.
################################################################################

################################################################################
# @description: outputs error to term
# @arg $1: error message
# @example:
#   mflibs::status::error "error_message" 1
################################################################################
mflibs::status::error() {
  declare message=${1:-"an unspecified error occurred"}
  declare mf_error=${2:-1}
  message=${message//$HOME/\~}
  echo -ne "\033[38;5;203merror\e[0m[$mf_error]: $message\n" >&2
}

################################################################################
# @description: outputs error to term and exits with provided return
# @arg $1: error message
# @arg $2: exit code
# @example:
#   mflibs::status::kill "error_message" 1
################################################################################
mflibs::status::kill() {
  mflibs::error "$1" "$2"; exit "${2:-1}"
}

################################################################################
# @description: outputs warn to term
# @arg $1: error message
# @example:
#   mflibs::status::warn "warning_message" 1
################################################################################
mflibs::status::warn() {
  declare message=${1:-"an unspecified error occurred"}
  declare mf_error=${2:-1}
  message=${message//$HOME/\~}
  echo -ne "\033[38;5;220mwarn\e[0m[$mf_error]: $message\n" >&2
}

################################################################################
# @description: outputs success to term
# @arg $1: success message
# @example:
#   mflibs::status::success "success_message"
################################################################################
mflibs::status::success() {
  declare message=${1:-"command completed successfully"}
  message=${message//$HOME/\~}
  echo -ne "\033[38;5;34msuccess\e[0m: $message\n"
}

################################################################################
# @description: outputs info to term
# @arg $1: info message
# @example:
#   mflibs::status::info "info_message"
################################################################################
mflibs::status::info() {
  declare message=${1:-"information not specified"}
  message=${message//$HOME/\~}
  echo -ne "\033[38;5;44minfo\e[0m: $message\n"
}