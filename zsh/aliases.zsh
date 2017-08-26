# Alias for printing out current IP Address
alias my-ip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed -e 's/\"//g'"

# Alias for locking screen on osx
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# Alias for fixing alcatraz plugin
alias fix-alcatraz='find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add `defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID`'
alias xcode-uuid='defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

alias mute-speaker="osascript -e 'set volume output muted true'"
alias max-speaker="osascript -e 'set volume output volume 100'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

function use-safe-rm {
  if [[ $OSTYPE == darwin* ]]; then
    alias rm="trash"
  fi
}

function use-unsafe-rm {
  unalias rm
}

# Damn, too lazy to type
# Fast jumping between directory bookmarks
alias j="jump"
alias g="git"
alias v="vim"
alias vi="vim"

# NOTE: ls alias is also defined in oh-my-zsh repo, below alias definition will overwrite oh-my-zsh's
alias ls="ls -GF"
