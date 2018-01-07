# Function to update spacemacs
function update_spacemacs {
  cd ~/.emacs.d
  echo "Moved to ~/.emacs.d"
  echo "Pulling the newest code from master branch"
  git pull origin master
  echo "Done, please restart your emacs client"
  cd -1
}

function clear_dsstore {
  find $1 -name '*.DS_Store' -type f -delete && echo 'ALL .DS_STORE FILES RECURSIVELY REMOVED'
}

function clean_xcode {
  rm -rf ~/Library/Developer/Xcode/DerivedData
  rm -rf ~/Library/Caches/com.apple.dt.Xcode
}

function boot_docker {
  boot2docker start
  $(boot2docker shellinit)
}

# Set macOS screenshot directory
function set_screenshot_dir {
  defaults write com.apple.screencapture location $1
}

# Reload xcode plugins, run this after upgrading xcode
# https://github.com/ForkPanda/RescueXcodePlug-ins
function reload_xcode_plugins {
  curl -s https://raw.githubusercontent.com/ForkPanda/RescueXcodePlug-ins/master/RescueXcode.sh | sh
}

# Load nvm explicitly only when we need it. It makes zsh slow
function load_nvm {
  # On macOS we have brew
  if test "$(which brew)"; then
    NVM_INSTALL=$(brew --prefix nvm)

    if [ -d "$NVM_INSTALL" ]; then
      export NVM_DIR="$HOME/.nvm"
      . "$NVM_INSTALL/nvm.sh"
    fi
  else
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  fi
}

# https://gist.github.com/XVilka/8346728
function print_colors {
  awk 'BEGIN {
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;

    for (colnum = 0; colnum<77; colnum++) {
      r = 255-(colnum*255/76);
      g = (colnum*510/76);
      b = (colnum*255/76);
      if (g>255) g = 510-g;
      printf "\033[48;2;%d;%d;%dm", r,g,b;
      printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
      printf "%s\033[0m", substr(s,colnum+1,1);
    }

    printf "\n";
  }'
}

# Remove simulators that is not listed in xcode.
function delete_unused_xcode_simulators {
  xcrun simctl delete unavailable
}


# See directory sizes sorted ascending by size
function dirsizes {
  du -h $1 | sort -h
}

# Copy file content to clipboard
function to_clipboard {
  cat $1 | pbcopy
}
