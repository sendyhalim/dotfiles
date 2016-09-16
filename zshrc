# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
export ZSH_PLUGIN=$ZSH_CUSTOM/plugins
export EDITOR=vim

# Install custom plugins if it does not exist
# TODO: use loop?
if [ ! -d $ZSH_PLUGIN/zshmarks ]; then
  echo "zsh plugin zshmarks does not exist, installing it..."
  git clone https://github.com/jocelynmallon/zshmarks.git $ZSH_PLUGIN/zshmarks
fi

if [ ! -d $ZSH_PLUGIN/zsh-syntax-highlighting ]; then
  echo "zsh plugin zsh-syntax-highlighting does not exist, installing it..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN/zsh-syntax-highlighting
fi

# Add zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Custom plugins:
# - zshmarks https://github.com/jocelynmallon/zshmarks
# - zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.
#   Must be the last plugin sourced.
plugins=(theme last-working-dir zshmarks zsh-syntax-highlighting docker)

source $ZSH/oh-my-zsh.sh

# Alias for printing out current IP Address
alias my-ip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed -e 's/\"//g'"

# Alias for locking screen on osx
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# Alias for fixing alcatraz plugin
alias fix-alcatraz='find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add `defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID`'

# Reclaim ctrl + s in zsh
stty -ixon

# Do not share history between terminals
setopt no_share_history

# Load additional setup
source $HOME/.customrc

# http://hoppsjots.org/?p=177
# Fix Underline + Color in TMUX (TERM=screen-256color)
$({ infocmp -x screen-256color; printf '\t%s\n' 'ncv@,'; } > /tmp/t && tic -x /tmp/t)

# ZSH Styles
ZSH_HIGHLIGHT_STYLES[command]=fg=39
ZSH_HIGHLIGHT_STYLES[builtin]=fg=39
ZSH_HIGHLIGHT_STYLES[alias]=fg=106
ZSH_HIGHLIGHT_STYLES[globbing]=fg=140
ZSH_HIGHLIGHT_STYLES[path]=fg=102
ZSH_HIGHLIGHT_STYLES[comment]=fg=244

# Function to update spacemacs
function updateSpacemacs {
  cd ~/.emacs.d
  echo "Moved to ~/.emacs.d"
  echo "Pulling the newest code from master branch"
  git pull origin master
  echo "Done, please restart your emacs client"
  cd -1
}

function cleardsstore {
  find $1 -name '*.DS_Store' -type f -delete && echo 'ALL .DS_STORE FILES RECURSIVELY REMOVED'
}

function cleanXcode {
  rm -rf ~/Library/Developer/Xcode/DerivedData
  rm -rf ~/Library/Caches/com.apple.dt.Xcode
}

function bootDocker {
  boot2docker start
  $(boot2docker shellinit)
}

# For swiftenv (version manager) https://github.com/kylef/swiftenv
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# Path
mkdir -p $HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin


if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh

  # Setting ag as the default source for fzf
  export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore=".git/" --ignore=".stack-work"'
fi
