#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${SCRIPT_DIR}/config.env"

source "${CONFIG}"

[ "$ENABLE_PROMPT" = true ] && source "${SCRIPT_DIR}/modules/prompt.sh"
[ "$ENABLE_OHMYPOSH" = true ] && source "${SCRIPT_DIR}/modules/ohmyposh.sh"
[ "$ENABLE_ALIASES" = true ] && source "${SCRIPT_DIR}/modules/aliases.sh"


tb_enable() {
  case $1 in
    prompt)
      sed -i 's/ENABLE_PROMPT=.*/ENABLE_PROMPT=true/' "$CONFIG"
      sed -i 's/ENABLE_OHMYPOSH=.*/ENABLE_OHMYPOSH=false/' "$CONFIG"
      ;;
    ohmyposh)
      sed -i 's/ENABLE_PROMPT=.*/ENABLE_PROMPT=false/' "$CONFIG"
      sed -i 's/ENABLE_OHMYPOSH=.*/ENABLE_OHMYPOSH=true/' "$CONFIG"
      ;;
    *)
      echo "Usage: tb_enable [prompt|ohmyposh]"
      return 1
      ;;
  esac

  source "${CONFIG}"
  source "${SCRIPT_DIR}/toolbox.sh"
  source ~/.bashrc
}
