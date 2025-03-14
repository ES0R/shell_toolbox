# Git branch function
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Colored prompt with git branch
PS1='\[\e[38;5;32m\]\u\[\e[0m\] \[\e[38;5;161m\]\w \[\e[38;5;126m\]$(parse_git_branch)\[\e[0m\] \$ '

# Aliases
alias ls='lsd'
alias ll='lsd -lh'
alias lstree='lsd --tree --depth 1'

# Custom git status function
gst() {
    set -e
    EXTRA_OPTS="--ignore-submodules"
    mapfile -t status < <(git -c color.status=always status --short $EXTRA_OPTS)

    if [ ${#status[@]} -eq 0 ]; then
        printf "\033[93mNothing to commit, working tree clean\033[0m\n"
        return
    fi

    len=-1
    for i in "${!status[@]}"; do
        status_no_c=$(sed -r 's/^(.[^ ]+) (.*)/\2/g' <<< "${status[i]}")
        if [ ${#status_no_c} -gt $len ]; then
            len=${#status_no_c}
        fi
    done

    mapfile -t diff < <(git diff --color $EXTRA_OPTS --stat HEAD 2> /dev/null | sed '$d; s/^ //' | cut -d '|' -f 2)

    for i in "${!status[@]}"; do
        cstat=${status[i]}
        cdiff=${diff[i]}
        if [ -n "$cdiff" ]; then
            cstat1=$(sed -r 's/^(.[^ ]+) (.*)/\1/g' <<< "$cstat")
            cstat2=$(sed -r 's/^(.[^ ]+) (.*)/\2/g' <<< "$cstat")
            printf "%s %*s │%s\n" "$cstat1" "-$len" "$cstat2" "$cdiff"
        else
            printf "%s\n" "$cstat"
        fi
    done
}