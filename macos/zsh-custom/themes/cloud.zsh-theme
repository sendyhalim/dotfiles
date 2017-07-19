if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='λ'
fi

# PROMPT='%F{25}❯❯❯%{$reset_color%} %F{39}$ZSH_THEME_CLOUD_PREFIX%f %{$fg_bold[green]%}%p %{$fg[green]%}%c %{$fg_bold[white]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
PROMPT='%F{39}$ZSH_THEME_CLOUD_PREFIX%f %{$fg_bold[green]%}%p %{$fg[green]%}%c %{$fg_bold[white]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[white]%}🌱 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[magenta]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
