zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
zsh_plugin_spec=${ZSH_CONFIG}/plugins.txt

source ${zsh_plugins}.zsh

function register_zsh_plugins {
  # INSTALL FIRST: brew install antidote
  if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugin_spec}.txt ]]; then
    (
      source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
      antidote bundle <${zsh_plugin_spec} >${zsh_plugins}.zsh
    )
  fi
}

# https://github.com/lukechilds/zsh-nvm#lazy-loading
# `lukechilds/zsh-nvm` plugin will auto install nvm in $HOME/.nvm
export NVM_LAZY_LOAD=true

# https://github.com/lukechilds/zsh-nvm#extra-commands-to-trigger-lazy-loading
# Lazy load nvm when using vim
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim' 'nvim' 'v')

# http://hoppsjots.org/?p=177
# Fix Underline + Color in TMUX (TERM=screen-256color)
$({ infocmp -x screen-256color; printf '\t%s\n' 'ncv@,'; } > /tmp/t && tic -x /tmp/t)

if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore=".git/" --ignore=".stack-work"'

export FZF_DEFAULT_OPTS='
  --color fg:188,bg:235,hl:103,fg+:222,bg+:236,hl+:104
  --color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
