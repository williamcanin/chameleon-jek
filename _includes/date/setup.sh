#!/usr/bin/env bash
#
# Type: Script Shell
# Description: "Date Lang Jekyll" is a Ruby plugins for the
#               date of inclusion containing multiple languages.
#
# Languages Supported:
# ch_CH
# de_DE
# en_US
# es_ES
# fr_FR
# it_IT
# ja_JP
# pt_PT
# ru_RU
#
# Supported OS: Linux - Architecture: x86_64/i586
# Release State: 1.0.0
# Script Name: setup.sh
# Project: https://github.com/williamcanin/date-lang-jekyll.git

# Author: William C. Canin
#   E-Mail: william.costa.canin@gmail.com
#   Home page: http://williamcanin.com

# License:
# The MIT License (MIT) for Oracle JDK Get (ojdk-get)

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
# Usage: bash setup.sh --help
#

#
#  Global variables
CHECK_INIT="0"
EXT_CONV="jk"
DIR_ROOT="lang"

# Help terminal
function _help() {

cat <<EOT
------------------------------------------------------------------------------
Date Lang Jekyll - The date on the language..
------------------------------------------------------------------------------

Mandatory initial command:
Command:
  ./$0 --init

Usage: ./initpost.sh [options] <value>
Options:
  -h,  --help        output instructions
  -i,  --init          generates the structure [Required]
  -po, --post       configuration variable for post
  -pa, --page       configuration variable for page
Example:
  ./$0 -po posting
  ./$0 -pa pages
Important Notes:
  - You must perform the initial command.
Copyright (c) William Canin
Licensed under the MIT license.
------------------------------------------------------------------------------
EOT

}

# Messages
msg_header() {
    printf "$(tput setaf 38)→ %s$(tput sgr0)\n" "$1"
}

msg_finish() {
    printf "$(tput setaf 76)✔ %s$(tput sgr0)\n" "$1"
}

msg_warning() {
    printf "$(tput setaf 3)! %s$(tput sgr0)\n" "$@"
}

# Check Dependencies
type xxd >/dev/null 2>&1 || {
  msg_warning "I require 'xxd' but it's not installed. Aborting"
  _missing_dep=1
}
type sed >/dev/null 2>&1 || {
  msg_warning "I require 'sed' but it's not installed. Aborting."
  _missing_dep=1
}
if [ "$_missing_dep" = "1" ]; then
  sleep 0.1
  exit 1
fi

# Modal set language
function _modal_set_lang(){
  mkdir -p $DIR_ROOT/.tmp
  cp -r $DIR_ROOT/$1 $DIR_ROOT/.tmp
  rm -r $DIR_ROOT/*
  cp -r $DIR_ROOT/.tmp/$1 $DIR_ROOT/
  rm -rf $DIR_ROOT/.tmp
}

# Select Language
function _select_language(){
msg_header "Choose your language (Answer with the number)"
LANG="$(ls $DIR_ROOT/ -1)"
PS3="Reply > "
select runner in $LANG Cancel
  do
    case $runner in
      en_US )
          _modal_set_lang "en_US"
        break
        ;;
      pt_PT )
          _modal_set_lang "pt_PT"
        break
      ;;
      ch_CH )
          _modal_set_lang "ch_CH"
        break
      ;;
      de_DE )
          _modal_set_lang "de_DE"
        break
      ;;
      es_ES )
          _modal_set_lang "es_ES"
        break
      ;;
      fr_FR )
          _modal_set_lang "fr_FR"
        break
      ;;
      it_IT )
          _modal_set_lang "it_IT"
        break
      ;;
      ja_JP )
          _modal_set_lang "ja_JP"
        break
      ;;
      ru_RU )
          _modal_set_lang "ru_RU"
        break
      ;;
      Cancel )
        msg_warning "Canceled by user"
        break
      ;;
    esac
done
msg_finish "Done."
}

#  Modal Convert Dat
function modal_convert(){
  xxd -p -r $1 $2
}

# Apply Convert
function _convert(){
  if [[ "$CHECK_INIT" == "0" ]]; then
      msg_warning "This setting has already been applied."
      exit 0
  else

    msg_header "Creating language structure ..."

    if [ -d "$DIR_ROOT/en_US" ]; then
      cd "$DIR_ROOT/en_US" && modal_convert "en_US.dat" "en_US.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT/pt_PT" ]; then
      cd "$DIR_ROOT/pt_PT" && modal_convert "pt_PT.dat" "pt_PT.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT/ch_CH" ]; then
      cd "$DIR_ROOT/ch_CH" && modal_convert "ch_CH.dat" "ch_CH.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT//de_DE" ]; then
      cd "$DIR_ROOT/de_DE" && modal_convert "de_DE.dat" "de_DE.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT/es_ES" ]; then
      cd "$DIR_ROOT/es_ES" && modal_convert "es_ES.dat" "es_ES.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT/fr_FR" ]; then
      cd "$DIR_ROOT/fr_FR" && modal_convert "fr_FR.dat" "fr_FR.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT/it_IT" ]; then
      cd "$DIR_ROOT/it_IT" && modal_convert "it_IT.dat" "it_IT.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT/ja_JP" ]; then
      cd "$DIR_ROOT/ja_JP" && modal_convert "ja_JP.dat" "ja_JP.$EXT_CONV" && cd ../..
    fi

    if [ -d "$DIR_ROOT/ru_RU" ]; then
      cd "$DIR_ROOT/ru_RU" && modal_convert "ru_RU.dat" "ru_RU.$EXT_CONV" && cd ../..
    fi

    # Clean files .dat
    CLEAN_ALL_DAT=$(find $DIR_ROOT/ -iname "*.dat")
    rm -rf $CLEAN_ALL_DAT

    # Set apply
    sed -i "s|^CHECK_INIT=.*|CHECK_INIT=\"0\"|g" $0

    msg_finish "Done."

  fi
}

# Modal config Post or Page
function _modal_post_page(){
  if [ ! -z "$POST" ]; then
    sed -i "3d" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "3i\{% assign m = $POST.date | date: \"%-m\" %}" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "18d" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "18i\{{ $POST.date | date: \"%d,\" }}" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "19d" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "19i\{{ $POST.date | date: \"%-Y\" }}" $DIR_ROOT/$1/$1.$EXT_CONV
  fi
  if [ ! -z "$PAGE" ]; then
    sed -i "20d" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "20i\{% assign m = $PAGE.date | date: \"%-m\" %}" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "35d" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "35i\{{ $PAGE.date | date: \"%d,\" }}" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "36d" $DIR_ROOT/$1/$1.$EXT_CONV
    sed -i "36i\{{ $PAGE.date | date: \"%-Y\" }}" $DIR_ROOT/$1/$1.$EXT_CONV
  fi
}

# Apply Config Post or Page
function _config_post_page(){
  msg_header "Starting configuration ..."

  if [ -d "$DIR_ROOT/en_US" ]; then
    _modal_post_page "en_US"
  fi
  if [ -d "$DIR_ROOT/pt_PT" ]; then
    _modal_post_page "pt_PT"
  fi
  if [ -d "$DIR_ROOT/ch_CH" ]; then
    _modal_post_page "ch_CH"
  fi
  if [ -d "$DIR_ROOT/de_DE" ]; then
    _modal_post_page "de_DE"
  fi
  if [ -d "$DIR_ROOT/es_ES" ]; then
    _modal_post_page "es_ES"
  fi
  if [ -d "$DIR_ROOT/fr_FR" ]; then
    _modal_post_page "fr_FR"
  fi
  if [ -d "$DIR_ROOT/it_IT" ]; then
    _modal_post_page "it_IT"
  fi
  if [ -d "$DIR_ROOT/ja_JP" ]; then
    _modal_post_page "ja_JP"
  fi
  if [ -d "$DIR_ROOT/ru_RU" ]; then
    _modal_post_page "ru_RU"
  fi

  msg_finish "Done."
}

# Menu
case $1 in
    -i|--init )
      _convert
      _select_language
    ;;
    -pa|--page )
      PAGE=$2
      _config_post_page $2
    ;;
    -po|--post )
      POST=$2
      _config_post_page $2
    ;;
    -h|--help)
      _help
    ;;
    * )
      msg_warning "Unrecognized command. See the help below:"
      _help
    ;;
esac
#
# End
