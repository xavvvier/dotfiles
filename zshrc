
source ~/dotfiles/bashrc

setopt prompt_subst             # allow command substitution inside the prompt
PROMPT='%~ $(git_branch)%# '     # set the prompt value

