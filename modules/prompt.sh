# Enhanced Git-aware Prompt
# Git-aware prompt (WSL-style)
if [ -f /etc/bash_completion.d/git-prompt ]; then
    source /etc/bash_completion.d/git-prompt
fi

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
PS1='\[\e[38;5;32m\]\u\[\e[0m\] \[\e[38;5;161m\]\w\[\e[33m\]$(__git_ps1 " (%s)")\[\e[0m\]\$ '
