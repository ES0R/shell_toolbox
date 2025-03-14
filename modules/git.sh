# Git-related functions
function git_current_branch() {
  git branch --show-current 2>/dev/null
}

function git_repo_name() {
  basename "$(git rev-parse --show-toplevel 2>/dev/null)" 2>/dev/null
}
