#!/bin/bash
#
# Type: Script Shell Installer
# Description: Simple script for installing Chameleon Jek for Linux.
#
#
# Supported Architecture: All
# Release State: 1.0.0
# Script Name: linux.sh

# Author: William C. Canin
#   E-Mail: william.costa.canin@gmail.com
#   Home page: http://williamcanin.com

# License:
# The MIT License (MIT) for Chameleon Jek

# Copyright (c) 2015 William C. Canin <william.costa.canin@gmail.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ******************************************************************************
#
# Note: Not use with root.
# Usage: bash linux.sh { requirements | init | install | reconfigure }
#
PATH="$PATH:src/lib/shell:src/lib/shell/functions:src/lib/shell/cache"

# Import Libs
source "os_check.lib"
source "set.lib"
source "variables.lib"
source "utils.lib"
source "configs.lib"
source "inotify_watchers.lib"
source "insecure_world_writable.lib"
source "requirements.lib"
source "restore_terminal.lib"
source "installs.lib"

# Check OS Linux
_OS_CHECK

case "$1" in
  init )
    if [[ "$REQUIREMENTS" != "true" ]]; then
      msg_warning "Apply the requirements: \"bash $0 requirements\""
    else
      if [[ "$CONFIG" != "true" ]]; then
        _INCLUDE_VARIABLES
        _CREATE_BOWERRC
        _CONFIG_BASHRC
        _CONFIG_GEMRC
        _INSECURE_WORLD_WRITABLE
        sed -i "s|^CONFIG=.*|CONFIG=\"true\"|g" "$DIR_SRC/shell/cache/set.lib"
        _RESTORE_TERMINAL
      else
        msg_warning "The settings have been applied."
      fi
    fi
    ;;
  install )
    if [[ "$REQUIREMENTS" != "true" ]]; then
      msg_warning "Apply the requirements: \"bash $0 requirements\"."
    else
      if [[ "$INSTALLS" != "true" ]]; then
        _INCLUDE_VARIABLES
        _CLEAN
        _INSTALLS
        sed -i "s|^INSTALLS=.*|INSTALLS=\"true\"|g" "$DIR_SRC/shell/cache/set.lib"
        _CLEAN
        msg_finish "Completed!"
        msg_warning "Execute: \"gulp serve\" and go to:"
        msg_warning "http://0.0.0.0:4000 in the browser."
      else
        printf "\nThe settings have been applied.\n\n"
      fi
    fi
    ;;
  reconfigure )
      _INCLUDE_VARIABLES
      sed -i "s|^INSTALLS=.*|INSTALLS=\"false\"|g" "$DIR_SRC/shell/cache/set.lib"
      sed -i "s|^CONFIG=.*|CONFIG=\"false\"|g" "$DIR_SRC/shell/cache/set.lib"
      sed -i "s|^REQUIREMENTS=.*|REQUIREMENTS=\"false\"|g" "$DIR_SRC/shell/cache/set.lib"
      sed -i '/# Path Ruby on Rails/,/# Path Ruby on Rails/d' ~/.bashrc
      msg_warning "[ ATTENTION! This will remove all gems installed for you ]"
      msg_warning "You want to remove the 'gems'? (Answer with the number)"
      PS3="Reply > "
      select runner in Yes No
      do
        case $runner in
          Yes)
            ruby "$DIR_SRC/ruby/gemreset.rb"
            break
          ;;
          No)
            msg_warning "Canceled by user!"
            break
          ;;
          *)
            msg_error "Option invalid!"
          ;;
        esac
      done
      printf "\nDone!\n\n"
    ;;
  requirements )
      if [[ "$REQUIREMENTS" != "true" ]]; then
        _INCLUDE_VARIABLES
        # _INOTIFY_WATCHERS
        _REQUIREMENTS
        sed -i "s|^REQUIREMENTS=.*|REQUIREMENTS=\"true\"|g" "$DIR_SRC/shell/cache/set.lib"
      else
        msg_warning "The settings have been applied."
      fi
    ;;
    * )
      msg_warning "* Usage: $0 { requirements | init | install | reconfigure }"
    ;;
esac
#
# End

