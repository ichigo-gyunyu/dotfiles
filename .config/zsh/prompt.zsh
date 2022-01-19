setopt prompt_subst

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='*'
    fi
}

NUM=$(shuf -i 1-230 -n 1)
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'

zstyle ':vcs_info:git:*' formats "%{$fg[yellow]%}%{$reset_color%} %F{$NUM}%b%m%c%u "

PROMPT='%B%F{$NUM}%n%f%b '
PROMPT+='%B%F{244}%2~%f%b '
PROMPT+='$vcs_info_msg_0_'
PROMPT+='%B%F{$NUM}› %f%b'

precmd () { print -Pn "\e]2;%~" } # title bar prompt
