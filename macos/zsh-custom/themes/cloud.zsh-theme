if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='λ'
fi

ZSH_THEME_DIRECTORY='%F{114}%c'
ZSH_THEME_PREFIX='%F{39}$ZSH_THEME_CLOUD_PREFIX%f'
ZSH_GIT_PROMPT='$(git_prompt_info)'

PROMPT="$ZSH_THEME_PREFIX   $ZSH_THEME_DIRECTORY $ZSH_GIT_PROMPT %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[magenta]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
