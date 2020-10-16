##
## Path to your oh-my-zsh configuration.
##

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

##
## Git aliases.
##

alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
alias gcp='git checkout -p'
alias gap='git add -p'
alias gaa='git add -A .'
alias gs='git status'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gum='git pull upstream master'
alias gitlatest='git for-each-ref --sort=-committerdate refs/heads/'
alias 🖕😏🖕="git push --force"

##
## Desktop app aliases.
##

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl -n $@"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias iina='/Applications/IINA.app/Contents/MacOS/IINA'

##
## Dev apps and frameworks aliases.
##

alias python=/Library/Frameworks/Python.framework/Versions/3.8/bin/python3
alias pip=/Library/Frameworks/Python.framework/Versions/3.8/bin/pip
alias webpack=/Users/dickhertz/node_modules/webpack/bin/webpack.js
alias gridsome=/Users/dickhertz/.npm-global/lib/node_modules/@gridsome/cli/bin/gridsome.js
alias live-server=/Users/dickhertz/.npm-global/lib/node_modules/live-server/live-server.js
alias serve="python -m http.server 8000"
alias serve2="python -m http.server 8500"
alias serve3="python -m http.server 9000"

##
## remember these are available: ffmpeg, ffplay, ffprobe,
## rubberband, youtoube-dl, mp4fpsmod, mpv, magick
##

##
##  Navigation aliases.
##

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

##
## Fake working.
##

alias working="export GREP_COLOR='1;32';while [ true ]; do head -n 100 /dev/urandom; sleep .1; done | hexdump -C | grep --color=auto 'ca fe'"

##
## Untracks anything in your updated .gitignore after accidental file type add

alias gri='git ls-files --ignored --exclude-standard | xargs -0 git rm -r'

##
## Open all merge conflicts or currently changed files
## in Sublime Switch out `code` for `subl`, `vim`, `atom`
## or your editor's CLI

alias gitfix='git diff --name-only | uniq | xargs subl'

##
## Changed your .gitignore _after_ you have added / committed
## some files? run `gri` to untrack anything in your
## updated .gitignore

alias gri="git ls-files --ignored --exclude-standard | xargs -0 git rm -r"
#
#
## Open all merge conflicts or currently changed files
## in Sublime Switch out `code` for `subl`, `vim`, `atom`
## or your editor's CLI

alias "git fix"="git diff --name-only | uniq | xargs subl"

##
## Take a screenshot every n seconds
## Fun for making timelapse gifs later. Run `creep 20`
## for every 20 seconds

function creep() {
    while :; do; echo "📸" $(date +%H:%M:%S); screencapture -x ~/Dropbox/Screenshots/creep/$(date +%s).png; sleep $1; done
}

##
## Display red dots while waitng for completion

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

function zource(){
  source ~/.zshrc && -
}

set-window-title() {
  window_title="\e]0;${${PWD/#"$HOME"/~}/Dropbox\//}\a"
  echo -ne "$window_title"
}

PR_TITLEBAR=''
set-window-title
add-zsh-hook precmd set-window-title

function dl() {
  svn checkout ${1:gs/tree\/master/trunk}
}

function openall() {
  for folder in */; do code $folder && hyper $folder; done
}
