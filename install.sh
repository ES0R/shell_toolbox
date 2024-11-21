#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Install required packages
#bash "${SCRIPT_PATH}/config/package_install.sh"

# Add customizations to .bashrc
echo "Adding shell_toolbox customizations to .bashrc"
echo -e "\n# shell_toolbox customizations" >> ~/.bashrc
cat "${SCRIPT_PATH}/scripts/bashrc_addons.sh" >> ~/.bashrc
source ~/.bashrc


echo "Shell customization complete"