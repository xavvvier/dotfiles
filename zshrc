# function to return current branch name while suppressing errors.
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ' (' $branch ') '
    fi
}

source ~/dotfiles/bashrc

setopt prompt_subst             # allow command substitution inside the prompt
PROMPT='%~ $(git_branch) > '     # set the prompt value


