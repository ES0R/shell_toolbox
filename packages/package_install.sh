#!/bin/bash

PACKAGE_LIST="packages/packages_list.txt"
    
if [ -f "$PACKAGE_LIST" ]; then
    echo "Installing packages from $PACKAGE_LIST..."
    while IFS= read -r package; do
        if ! dpkg -l | grep -q "^ii  $package "; then
            sudo apt-get install -y "$package"
        else
            echo "$package is already installed, skipping."
        fi
    done < "$PACKAGE_LIST"
else
    echo "Package list file not found. Skipping package installation."
fi

echo "Package installation complete."
