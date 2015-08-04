#!/bin/bash
# File: setup.sh
# Description: Simple script for, Prepare and resolve dependencies for Chameleon Theme
# Version: 1.0.4
# Language: Shell script
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.com>
# Description: Script config for "Chameleon theme".


function _permissions(){

	if [[ -d "/usr/lib/ruby" ]]; then
		chmod 755 -R /usr/lib/ruby
	fi

}

function _install_packages_linux(){

	if [[ ! -d "./.tmp" ]]; then
		mkdir ./.tmp
	fi

	if [[ -f "/usr/bin/apt" ]]; then
		apt-get update 2>&1 >/dev/null
		apt-get install git git-core ruby-full rake nodejs npm python -y 2>&1 >/dev/null
		
	elif [[ -f "/usr/bin/yum" ]]; then
		yum update 2>&1 >/dev/null
		yum install git ruby ruby-devel rubygems rake nodejs npm python -y 2>&1 >/dev/null
		
	elif [[ -f "/usr/bin/pacman" ]]; then

		_permissions
		pacman -Sc git rubygems nodejs npm python --noconfirm > ./.tmp/tmp.log
		echo "[Ok]"
		echo "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:$PATH\"" >> ~/.bashrc
		source ~/.bashrc
		_permissions

		if [[ -d "./.tmp" ]]; then
			rm -rf ./.tmp
		fi

	else
		echo "Script not support their distribution."
	fi

}


function _compile(){

	if [ -f "/usr/bin/node" ] && [ -f "/usr/bin/npm" ]; then
		
		echo ""
		echo "Installing dependencies \"Bundler\" for Chameleon Theme."
		echo "Wait ..."
		echo ""
		bundle install
		echo ""
		echo "Compiling Chamelen Theme."
		echo "Wait ..."
		echo ""
		rake make_install

	else

		echo ""
		echo "Using command: $0  -p"
		echo ""

	fi

}

function _prepare(){

		echo "Preparing and installing required packages on your machine."
		echo "Wait ..."
		echo ""

		# Instalar packages on distribuition
		_install_packages_linux
					

		# Create link simbolic
	if [ -e "/usr/bin/nodejs" ]; then
		ln -s /usr/bin/nodejs /usr/bin/node
	fi

					
		# Install package manager (GruntJS, Bower and Bundler)
		echo ""
		echo "Installing GruntJs e Bower ..."
		echo "Wait ..."
		echo ""
		# npm uninstall -g grunt grunt-cli bower
		npm install -g grunt grunt-cli bower
		echo ""
		echo "Installing Bundler ..."
		echo "Wait ..."
		echo ""
		gem install bundler

}

function _help(){

		echo ""
		echo "=================================================="
		echo "Options			Description"
		echo "--------------------------------------------------"
		echo ""
		echo "-p 		Prepare. install required packages "
		echo "		in your distribution Linux to use " 
		echo "		the \"Chameleon Theme\"."
		echo ""
		echo "-c 		Compile. Resolves dependencies of "
		echo "		\"Chameleon theme\""
		echo ""

}

# Menu
	case "$1" in

		-p)

			# sudo passwd root
			if [ "$(id -u)" != "0" ]; then
				
				echo
				echo "This option needs to be root."
				echo "Continue? (y/n)"
				read pass

				case $pass in

					y|Y)

						echo "Root password - "
						su -c "/bin/bash setup.sh -p"
						# su - root -c "bash setup.sh"

					;;

					n|N)

						exit 0

					;;

					*)

						echo "Option invalid!"

					;;

				esac
				
			else

				_prepare
				
				
			fi
		;;
		

		-c)
	
			_compile
			
		;;

		help)

			_help

		;;

		*)

	
			echo ""
			echo "Usage: $0  { -p | -c | help }"
			echo ""

		;;

	esac
