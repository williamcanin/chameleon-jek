#!/bin/bash
# File: setup.sh
# Description: Simple script for, Download, Prepare and resolve dependencies for Chameleon Theme
# Version: 1.0.4
# Lisence: MIT
# Language: Shell script
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.com>


# Permissions for folders
function _permissions(){

	if [[ -d "/usr/lib/ruby" ]]; then
		chmod 755 -R /usr/lib/ruby
	fi

}

# Function for install requeriments 
function _install_packages_linux(){


	if [[ -f "/usr/bin/apt" ]]; then
		apt-get update 2>&1 >/dev/null
		apt-get install git git-core ruby-full rake nodejs npm python -y 2>&1 >/dev/null
		
	elif [[ -f "/usr/bin/yum" ]]; then
		yum update 2>&1 >/dev/null
		yum install git ruby ruby-devel rubygems rake nodejs npm python -y 2>&1 >/dev/null
		
	elif [[ -f "/usr/bin/pacman" ]]; then
		_permissions
		# All installed
		# pacman -Sy git ruby nodejs npm python --noconfirm 2>&1 >/dev/null

	if [[ ! -n $(pacman -Q ruby) ]]; then
		pacman -Sy ruby --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n $(pacman -Q git) ]]; then
		pacman -Sy git --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n $(pacman -Q nodejs) ]]; then
		pacman -Sy nodejs --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n $(pacman -Q npm) ]]; then
		pacman -Sy npm --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n $(pacman -Q python) ]]; then
		pacman -Sy python --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi	
		
		echo "Packages not found solved !"
		echo "[Ok]"
		echo "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:$PATH\"" >> ~/.bashrc
		source ~/.bashrc
		
		
		_permissions

	else
		echo "WARNING! Script not support their distribution Linux."
		echo ""
		echo "You will have to manually install the applications "
		echo "in this Linux distribution."
		echo "For information on requirements, see:"
		echo "https://github.com/williamcanin/chameleon-theme-jekyll#requirements"
		echo ""
	fi

}

# Automatic
function _download_prepare_compile(){


	bash setup.sh -p
	echo "Unloading \"Chameleon Theme\" wait ..."
	echo ""
	git clone https://github.com/williamcanin/chameleon-theme-jekyll.git
	cd chameleon-theme-jekyll
	bash setup.sh -c

}

# Compile dependencies for Chameleon Theme
function _compile(){

	if [ -f "/usr/bin/node" ] && [ -f "/usr/bin/npm" ]; then


		if  [ -f "./README.md" ] && [ -n $(grep -R 'Chameleon Theme' ./README.md) ]; then
			
			echo "Installing Bundler ..."
			echo "Wait ..."
			echo ""
			gem install bundler
			echo ""
			echo "Installing dependencies \"Bundler\" for Chameleon Theme."
			echo "Wait ..."
			echo ""
			bundle install --path ~/.gem
			echo ""
			echo "Compiling Chamelen Theme."
			echo "Wait ..."
			echo ""
			rake make_install

		else

			echo "You are not within the \"Chameleon Theme\" folder. You can only build within the folder."
		
		fi

	else

		echo ""
		echo "Using command: $0  -p"
		echo ""

	fi

}

# Prepare requeriments for distribuition Linux
function _prepare(){

		# Add user in /etc/sudoers
		# echo "`logname` ALL=(ALL) ALL" >> /etc/sudoers	
		echo "Preparing and installing required packages on your machine."
		echo "Wait ..."
		echo ""

		# Instalar packages on distribuition
		_install_packages_linux
					

		# Create link simbolic
	if [ -e "/usr/bin/nodejs" ] && [ ! -e "/usr/bin/node" ]; then
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
		# Install bundler for Root
		# echo "Installing Bundler ..."
		# echo "Wait ..."
		# echo ""
		# gem install bundler

}

# Help script "setup.sh"
function _help(){

		echo ""
		echo "=================================================="
		echo "Options			Description"
		echo "--------------------------------------------------"
		echo ""
		echo "-p 		Prepare. install required packages "
		echo "		in your distribution Linux to use " 
		echo "		the \"Chameleon Theme\"*"
		echo ""
		echo "-c 		Compile. Resolves dependencies of "
		echo "		\"Chameleon theme\"*"
		echo ""
		echo "all 		Automatic. Download the \"Chameleon Theme\"," 
		echo "		prepares the requirements for \"Chameleon Theme\""
		echo "		in your Linux distribution and compile"
		echo "		dependencies \"Chameleon Theme\"."
		echo ""
		echo "* within the folder already downloaded on Chameleon Theme"
		echo ""

}

# Menu of script script "setup.sh"

	case "$1" in

		all)
			_download_prepare_compile
		;;

		-p)

			# sudo passwd root
			if [ "$(id -u)" != "0" ]; then
				
				echo
				echo "This option needs to be root."
				echo "Continue? (y/n)"
				read pass

				case $pass in

					y|Y)

						echo "Root password > "
						su -c "/bin/bash setup.sh -p"
						# su - root -c "bash setup.sh"
						echo ""

					;;

					n|N)

						exit 0

					;;

					*)
						echo ""
						echo "Option invalid!"
						echo ""	
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
			echo "Usage: $0  { -p | -c | all | help }"
			echo ""

		;;

	esac



