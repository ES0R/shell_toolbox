#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PACKAGE_LIST="${SCRIPT_PATH}/../config/packages.txt"

while IFS= read -r package; do
    if ! dpkg -l | grep -q "^ii  $package "; then
        sudo apt-get install -y "$package"
    fi
done < "$PACKAGE_LIST"