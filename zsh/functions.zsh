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

# Measure zsh start time
function measure_zsh_start_time {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

function print_256_colors {
  for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
      printf "\n";
    fi
  done
}

function set_login_bg_with_current_wallpaper {
  os="Mojave"
  wallpaper_path=$(sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db 'select * from data limit 1 offset (select (count(*) - 1) from data)')

  # https://superuser.com/a/474199
  wallpaper_path=$(eval echo "$wallpaper_path")

  os_pictures_dir="/Library/Desktop Pictures"
  default_wallpaper="$os_pictures_dir/$os.heic"
  backup_path="$os_pictures_dir/$os - Backup.heic"

  if [ ! -f "$backup_path" ]
  then
    echo "I'm gonna backup $default_wallpaper to $backup_path"
  fi

  echo "Replacing $default_wallpaper with $wallpaper_path"
  cp "$wallpaper_path" "$default_wallpaper"
}

# Function to convert hex to 256 term color.
# Usage:
# hex_to_256_color A52A2A
# hex_to_256_color "#A52A2A"
#
# Source: https://gist.github.com/mhulse/b11e568260fb8c3aa2a8
function hex_to_256_color() {
  hex=$1
  if [[ $hex == "#"* ]]; then
    hex=$(echo $1 | awk '{print substr($0,2)}')
  fi
  r=$(printf '0x%0.2s' "$hex")
  g=$(printf '0x%0.2s' ${hex#??})
  b=$(printf '0x%0.2s' ${hex#????})
  echo -e `printf "%03d" "$(((r<75?0:(r-35)/40)*6*6+(g<75?0:(g-35)/40)*6+(b<75?0:(b-35)/40)+16))"`
}
