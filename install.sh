#/bin/bash
echo "Installing dependences ..."
bundle install
echo "Installing Chameleon Theme..."
npm install
echo "Compile Chameleon Theme..."
rake make_install