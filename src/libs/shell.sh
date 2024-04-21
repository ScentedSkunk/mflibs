#!/usr/bin/env bash
################################################################################
# @file_name: shell
# @version: 1.1.188
# @project_name: mflibs
# @brief: a library for shell output functions
#
# @author: Jamie Dobbs (awildamnesiac)
# @author_contact: awildamnesiac@protonmail.ch
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2024, Jamie Dobbs
# All rights reserved.
################################################################################

################################################################################
# @description: outputs new line
# @noargs
################################################################################
mflibs::shell::misc::nl() {
  printf "\n"
  [[ " ${MFLIBS_LOADED[*]} " =~ log ]] && printf "\n" >> "${mflibs_log_location:?}"
}

################################################################################
# @description: standard shell output
# @example:
#   mflibs::shell::text "hi"
# @arg $1: string
################################################################################
mflibs::shell::output() {
  declare shell_reset;shell_reset=$(tput sgr0)
  if [[ -z ${shell_newline} ]]; then
    declare shell_newline="\n"
  else
    unset shell_newline
  fi
  if [[ -n ${shell_icon} && -n "$*" ]]; then
    declare shell_newline="\n"
  elif [[ -n ${shell_icon} && -z "$*" ]]; then
      unset shell_newline
  fi
  case "${shell_option}" in
    bold) shell_option=$(tput bold);;
    underline) shell_option=$(tput smul);;
    standout) shell_option=$(tput smso);;
  esac
  case "${shell_icon}" in
    arrow) shell_icon="➜ ${shell_reset}";;
    warning) shell_icon="⚠ ${shell_reset}";;
    check) shell_icon="✓ ${shell_reset}";;
    cross) shell_icon="✗ ${shell_reset}";;
  esac
  if [[ ${mflibs_echo:-} -eq 1 ]]; then
    printf -- "%s${shell_newline}" "$@"
  else
    printf -- "${shell_reset}${shell_color}${shell_icon}${shell_option}%s${shell_newline}${shell_reset}" "$@"
    [[ " ${MFLIBS_LOADED[*]} " =~ log ]] && printf "${shell_icon}%s${shell_newline}" "$@" >> "${mflibs_log_location}"
  fi
  unset shell_color shell_newline shell_option shell_icon
}

mflibs::shell::text() {
  mflibs::shell::output "$@"
}
mflibs::shell::text::sl() {
  declare -g shell_newline=0
  mflibs::shell::output "$@"
}
mflibs::shell::text::black() {
  declare -g shell_color; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::black::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red() {
  declare -g shell_color; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green() {
  declare -g shell_color; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow() {
  declare -g shell_color; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue() {
  declare -g shell_color; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta() {
  declare -g shell_color; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan() {
  declare -g shell_color; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white() {
  declare -g shell_color; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white::sl() {
  declare -g shell_color shell_newline=0; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}

################################################################################
# @description: bold shell output
# @example:
#   mflibs::shell::text::bold "hi"
# @arg $1: string
################################################################################
mflibs::shell::text::bold() {
  declare -g shell_option=bold
  mflibs::shell::output "$@"
}
mflibs::shell::text::bold::sl() {
  declare -g shell_option=bold shell_newline=0;
  mflibs::shell::output "$@"
}
mflibs::shell::text::black::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::black::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white::bold() {
  declare -g shell_color shell_option=bold; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white::bold::sl() {
  declare -g shell_color shell_option=bold shell_newline=0; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}

################################################################################
# @description: underline shell output
# @example:
#   mflibs::shell::text::underline "hi"
# @arg $1: string
################################################################################
mflibs::shell::text::underline() {
  declare -g shell_option=underline
  mflibs::shell::output "$@"
}
mflibs::shell::text::underline::sl() {
  declare -g shell_option=underline shell_newline=0;
  mflibs::shell::output "$@"
}
mflibs::shell::text::black::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::black::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white::underline() {
  declare -g shell_color shell_option=underline; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white::underline::sl() {
  declare -g shell_color shell_option=underline shell_newline=0; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}

################################################################################
# @description: standout shell output
# @example:
#   mflibs::shell::text::standout "hi"
# @arg $1: string
################################################################################
mflibs::shell::text::standout() {
  declare -g shell_option=standout
  mflibs::shell::output "$@"
}
mflibs::shell::text::standout::sl() {
  declare -g shell_option=standout shell_newline=0;
  mflibs::shell::output "$@"
}
mflibs::shell::text::black::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::black::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::red::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::green::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::yellow::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::blue::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::magenta::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::cyan::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white::standout() {
  declare -g shell_color shell_option=standout; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}
mflibs::shell::text::white::standout::sl() {
  declare -g shell_color shell_option=standout shell_newline=0; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}

################################################################################
# @description: arrow shell functions
# @example:
#   mflibs::shell::icon::arrow "hi"
# @arg $1: string
################################################################################
mflibs::shell::icon::arrow() {
  declare -g shell_icon=arrow
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::black() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::red() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::green() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::yellow() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::blue() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::magenta() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::cyan() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::arrow::white() {
  declare -g shell_color shell_icon=arrow; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}

################################################################################
# @description: warning shell outputs
# @example:
#   mflibs::shell::icon::warning "hi"
# @arg $1: string
################################################################################
mflibs::shell::icon::warning() {
  declare -g shell_icon=warning
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::black() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::red() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::green() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::yellow() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::blue() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::magenta() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::cyan() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::warning::white() {
  declare -g shell_color shell_icon=warning; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}

################################################################################
# @description: check shell outputs
# @example:
#   mflibs::shell::icon::check "hi"
# @arg $1: string
################################################################################
mflibs::shell::icon::check() {
  declare -g shell_icon=check
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::black() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::red() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::green() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::yellow() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::blue() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::magenta() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::cyan() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::check::white() {
  declare -g shell_color shell_icon=check; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}

################################################################################
# @description: cross shell outputs
# @example:
#   mflibs::shell::icon::cross "hi"
# @arg $1: string
################################################################################
mflibs::shell::icon::cross() {
  declare -g shell_icon=cross
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::black() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 0)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::red() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 1)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::green() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 2)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::yellow() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 3)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::blue() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 4)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::magenta() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 5)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::cyan() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 6)
  mflibs::shell::output "$@"
}
mflibs::shell::icon::cross::white() {
  declare -g shell_color shell_icon=cross; shell_color=$(tput setaf 7)
  mflibs::shell::output "$@"
}