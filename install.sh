#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/config.env"

cat > "$CONFIG_FILE" << EOF
ENABLE_PROMPT=false
ENABLE_OHMYPOSH=false
EOF

grep -qxF "source ${SCRIPT_DIR}/toolbox.sh" ~/.bashrc || \
  echo "source ${SCRIPT_DIR}/toolbox.sh" >> ~/.bashrc

echo "Installation complete."
