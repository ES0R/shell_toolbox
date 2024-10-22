#!/bin/bash

# Update and Install Packages
bash ./packages/package_install.sh

# Append customizations to .bashrc
BASHRC_PATH="$HOME/.bashrc"
ADDONS_FILE=".bashrc_addons"

if [ -f "$ADDONS_FILE" ]; then
    echo "# Adding custom shell settings from shell_custom_toolbox" >> "$BASHRC_PATH"
    cat "$ADDONS_FILE" >> "$BASHRC_PATH"
    echo "Custom shell settings added to .bashrc"
else
    echo "Addons file not found. Skipping .bashrc customization."
fi

# Reload .bashrc to apply changes
source "$BASHRC_PATH"

echo "Shell customization complete."
