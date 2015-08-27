#!/bin/bash
# File: setup.sh
# Description: Simple script for, Download, Prepare and resolve dependencies for Chameleon Theme
# Version: 1.0.4
# Lisence: MIT
# Language: Shell script
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.com>


# Variables
FOLDER_CONF=~/.chameleon_theme
FILE_PKG="packages_install.sh"
FILE_CONF="configs"
PATH_FILE_PKG="$FOLDER_CONF/$FILE_PKG"
PATH_FILE_CONF="$FOLDER_CONF/$FILE_CONF"
DIR_CLONE="https://github.com/williamcanin/chameleon-theme-jekyll.git"
# PATH_BUNDLE_INSTALL_GEMS="~/.gem"
PATH_BUNDLE_INSTALL_GEMS="assets/vendor"



# Create directories the script settings
if [ ! -d $FOLDER_CONF ]; then
	mkdir $FOLDER_CONF
fi


function _create_configs(){

/bin/cat << EOF > $PATH_FILE_CONF
passwd_root_correct=$1
EOF

}
_create_configs "null"


function _CONFIG_PATH_GEMS(){

		# echo "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:$PATH\"" >> ~/.bashrc

		# PWD_LOCAL=`pwd`
		# BUNDLE_PATH="assets/vendor/bundle"
		# BUNDLE_BIN="$(ruby -e 'print Gem.user_dir' | sed 's/^.*.gem\///' | sed 's/$/\/bin/')"
		# PATH_FULL="$PWD_LOCAL/$BUNDLE_PATH/$BUNDLE_BIN"
		# echo >> ~/.bashrc
		# echo >> ~/.bashrc
		# echo "#Added the \"path\" of the 'gems' of the project Chameleon Theme" >> ~/.bashrc
		# echo PATH=\""$PATH_FULL:$PATH\"" >> ~/.bashrc
		# source ~/.bashrc

		PWD_LOCAL=`pwd`
		BUNDLE_PATH="assets/vendor/bundle"
		BUNDLE_BIN="$(ruby -e 'print Gem.user_dir' | sed 's/^.*.gem\///' | sed 's/$/\/bin/')"
		PATH_FULL="$PWD_LOCAL/$BUNDLE_PATH/$BUNDLE_BIN"


/bin/cat << EOF >> ~/.bashrc


#Added the "path" of the 'gems' of the project Chameleon Theme"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH_FULL:$PATH"

EOF
		source ~/.bashrc

}


function _INSTALL_BUNDLER(){

	echo 
	echo "Installing Bundler ..."
	echo "Wait ..."
	echo ""
	gem install bundler
	echo

}


# --------------------------------------------------------------------------------------------------------

# =====================================================
# Function for packages of applications installed on Linux
#
# Begin
#
function _requirements(){



/bin/cat << EOF > $PATH_FILE_PKG

#!/bin/bash
echo "passwd_root_correct=y" > $PATH_FILE_CONF

# Function for install requeriments 
function _install_packages_linux(){

	# Add user in /etc/sudoers
	echo "`logname` ALL=(ALL) ALL" >> /etc/sudoers	
	echo "Preparing and installing required packages on your machine."
	echo "Wait ..."
	echo ""
	

	# Instalar packages on distribuition
	if [[ -f "/usr/bin/apt" ]]; then
		apt-get update 2>&1 >/dev/null
		apt-get install git git-core ruby-full rake nodejs npm python -y 2>&1 >/dev/null
	

	elif [[ -f "/usr/bin/yum" ]] && [[ ! -f "/usr/bin/dnf" ]]; then
		MANAGER_PGK="yum"
		$MANAGER_PGK update 2>&1 >/dev/null
		$MANAGER_PGK install git ruby ruby-devel rubygems rake nodejs npm python -y 2>&1 >/dev/null
	
	elif [[ -f "/usr/bin/yum" ]] && [[ -f "/usr/bin/dnf" ]]; then
		MANAGER_PGK="dnf"
		$MANAGER_PGK update 2>&1 >/dev/null
		$MANAGER_PGK install git ruby ruby-devel rubygems rake nodejs npm python -y 2>&1 >/dev/null
		
		
	elif [[ -f "/usr/bin/pacman" ]]; then
		# All installed
		# pacman -Sy git ruby nodejs npm python --noconfirm 2>&1 >/dev/null

	if [[ ! -n \$(pacman -Q ruby) ]]; then
		pacman -Sy ruby --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n \$(pacman -Q git) ]]; then
		pacman -Sy git --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n \$(pacman -Q nodejs) ]]; then
		pacman -Sy nodejs --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n \$(pacman -Q npm) ]]; then
		pacman -Sy npm --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi

	if [[ ! -n \$(pacman -Q python) ]]; then
		pacman -Sy python --noconfirm 2>&1 >/dev/null
		echo "Solving ..."
	fi	
		
		echo "Packages not found solved !"
		echo "[Ok]"

	else
		echo "WARNING! Script not support their distribution Linux."
		echo ""
		echo "You will have to manually install the applications "
		echo "in this Linux distribution."
		echo "For information on requirements, see:"
		echo "https://github.com/williamcanin/chameleon-theme-jekyll#requirements"
		echo ""
	fi



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

# Start install packages
_install_packages_linux

EOF

# Giving execute permission to the script
chmod +x $PATH_FILE_PKG

}

_requirements

#
# End
#
# Function for packages of applications installed on Linux

# --------------------------------------------------------------------------------------------------------


# Compile dependencies for Chameleon Theme
function _compile(){


	if [ -f "/usr/bin/gem" ] && [ "$(id -u)" != "0" ]; then
		
		source src/.verify 

		# if  [ -f "./README.md" ] && [ -n "$(grep -R 'Chameleon Theme' ./README.md)" ]; then
		if  [[ "$TYPE_PROJECT" = "Chameleon-Theme" ]]; then
			
			_INSTALL_BUNDLER
			_CONFIG_PATH_GEMS
			echo ""
			echo "Installing dependencies \"Bundler\" for Chameleon Theme."
			echo "Wait ..."
			echo ""
			bundle install --path $PATH_BUNDLE_INSTALL_GEMS
			echo ""
			echo "Compiling Chamelen Theme."
			echo "Wait ..."
			echo ""
			rake make_install

		else

			echo ""
			echo "You are not within the \"Chameleon Theme\" folder. You can only build within the folder."
			echo ""

		fi

	else

		echo ""
		echo "Issue! :("
		echo "Causes of the problem:"
		echo "1 - \"RubyGems\" is not installed. Please install to proceed."
		echo "2 - Are you compiled with the account \"root\", please use a regular user account."
		echo "Installation aborted :("
		echo ""

	fi

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

# Automatic
function _prepare_download_compile(){


		_verify_root_and_prepare

		source $FOLDER_CONF/configs

		if [ $passwd_root_correct == "y" ]; then
			
		if [[ ! -d "chameleon-theme-jekyll" ]]; then
			echo "Unloading \"Chameleon Theme\" wait ..."
			echo ""
			git clone $DIR_CLONE
		fi	

			if [[ -f "chameleon-theme-jekyll/setup.sh" ]]; then
				rm -f chameleon-theme-jekyll/setup.sh
				cp setup.sh chameleon-theme-jekyll 
			fi

			cd chameleon-theme-jekyll

			_compile
			rm -r $FOLDER_CONF

		else

			echo ""
			echo "Sorry :("
			echo "Incorrect password"	
			echo ""
			rm -r $FOLDER_CONF

		fi

}


function _verify_root_and_prepare(){

			# sudo passwd root
			if [ "$(id -u)" != "0" ]; then
				
				echo
				echo "This option needs to be root."
				echo "Continue? (y/n)"
				read pass

				case "$pass" in

					y|Y)

						echo "Root password > "
						su -c "$PATH_FILE_PKG"
						
						# su - root -c "$PATH_FILE_PKG"
						echo ""

					;;

					n|N)	
						
						_create_configs "n"

						echo ""
						echo "Operation canceled by user."
						echo ""
						exit 0

					;;

					*)
						echo ""
						echo "Option invalid!"
						echo ""
						_create_configs "null"
						exit 0
					;;

				esac
				

			fi

}


# Menu of script script "setup.sh"

	case "$1" in

		all)
			_prepare_download_compile
		;;

		-p)

			_verify_root_and_prepare

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



