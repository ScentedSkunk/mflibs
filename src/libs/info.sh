#!/usr/bin/env bash
################################################################################
# @file_name: info
# @version: 1.1.40
# @project_name: mflibs
# @brief: a library for information functions
#
# @author: Jamie Dobbs (awildamnesiac)
# @author_contact: awildamnesiac@protonmail.ch
#
# @license: BSD-3 Clause (Included in LICENSE)
# Copyright (C) 2021-2024, Jamie Dobbs
# All rights reserved.
################################################################################

################################################################################
# @description: outputs IPv4 address via dig
# @example:
#   mflibs::info::ipv4::dig
# @return_code: 0 success
# @return_code: 1 unable to resolve ip
################################################################################
mflibs::info::ipv4::dig() {
  dig @resolver4.opendns.com myip.opendns.com +short -4 || return 1
}

################################################################################
# @description: outputs local IPv4 address
# @example:
#   mflibs::info::ipv4::local
# @return_code: 0 success
# @return_code: 1 unable to resolve ip
################################################################################
mflibs::info::ipv4::local() {
  ip addr show | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}' | cut -d/ -f1 | head -n 1 && return 0
  return 1
}