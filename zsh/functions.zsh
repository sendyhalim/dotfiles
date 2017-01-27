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

