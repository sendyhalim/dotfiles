export ZPLUG_HOME=$(brew --prefix)/opt/zplug

if [ ! -d $ZPLUG_HOME ]; then
  brew install zplug
fi

source $ZPLUG_HOME/init.zsh

# Note run `zplug install` in order to install these plugins
zplug "jocelynmallon/zshmarks"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"


# Load plugins
zplug load

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
