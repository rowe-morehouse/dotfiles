########################################
##                                    ##
##  Rowe Morehouse .profile 20201025  ##
##                                    ##
########################################

##
##  Load the shell .profiles, and then some.
##

for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

##
##  Add case-insensitive globbing for tab pathname expansion.
##

shopt -s nocaseglob

##
## Desktop apps aliases.
##

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl -n $@"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias iina='/Applications/IINA.app/Contents/MacOS/IINA'

##
## Command line apps aliases.
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
## Download highest video, or highest qual .wav or .m3, or 16Khz mono audio for speech-to-text
##
alias 'ydlv'="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias 'ydlw'="youtube-dl -u --extract-audio --audio-format wav --audio-quality 0 -f bestaudio"
alias 'ydlm'="youtube-dl -u --extract-audio --audio-format mp3 --audio-quality 0 -f bestaudio"
alias 'ydlstt'="youtube-dl --extract-audio --audio-format wav --audio-quality 0 --postprocessor-args '-osr 16000 -ac 1'"

##
## remember: these apps are available: ffmpeg, ffplay, ffprobe,
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
## Detect which `ls` flavor is in use
##

if ls --color > /dev/null 2>&1; then
  colorflag="--color"
else
  colorflag="-G"
fi

##
## Directory listing and nav.
##

alias l="ls -la ${colorflag}" ## One key to list all files, nicely colorized.
alias lsd='ls -l | grep "^d"' ## List only directories.
alias db="cd ~/Dropbox/"

##
## Always use pretty color output for `ls`
##

if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias ls="command ls -G"
else
  alias ls="command ls --color"
  export LS_COLORS='.md=01;35:no=00:fi=01;35:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

##
## Git aliases.
##

alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
alias gcp='git checkout -p'
alias gap='git add -p'
alias gaa='git add -A .'
alias gs='git status'
alias gb='git branch'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gum='git pull upstream master'
alias gitlatest='git for-each-ref --sort=-committerdate refs/heads/'
alias 🖕😏🖕="git push --force"
alias gpo="git push origin"
alias gc="git commit -m"
alias gsh="git stash"
alias gd="git diff"
alias gpl="git pull origin"

##
## autocomplete branch names
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

##
## Untracks anything in your updated .gitignore after accidental file type add
alias gri='git ls-files --ignored --exclude-standard | xargs -0 git rm -r'

##
## Open all merge conflicts or currently changed files in Sublime
## Switch out `code` for `subl`, `vim`, `atom` or your editor's CLI
alias gitfix='git diff --name-only | uniq | xargs subl'

##
## Show Git branch and clean / dirty status at the prompt
##

function git_info() {
  # check if we're in a git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # quickest check for what branch we're on
  branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

  # check if it's dirty (via github.com/sindresorhus/pure)
  dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

  echo $WHITE" on "$PURPLE$branch$dirty
}

##
## IP addresses.
##

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

##
## Recursively delete pesky `.DS_Store` files.
##

alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

##
## Default timestamps for history.
##

export HISTTIMEFORMAT='%d-%b-%Y %r '

##
## PATH MUNGING. Add all of these to the PATH variable. The colon (:)
## is the path separator. To "add something to path," add the path to
## its executable file to this list of paths here.
##

PATH=${PATH}:~/bin
PATH=${PATH}:/usr/local/bin
export PATH=$PATH:/Users/dickhertz/.npm-global/node_modules
export PATH=$PATH:/Users/dickhertz/.npm-global/bin
export EDITOR="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl -n $@"
export PATH=${PATH}:~/dev/adt-bundle/sdk/platform-tools:~/dev/adt-bundle/sdk/tools
export PATH="/usr/local/Cellar/php54/5.4.33/lib:$PATH"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:usr/local/bin/node_modules:~/bin"
export PATH=$HOME/gems/bin:$PATH
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=${PATH}:$HOME/gsutil
export GOOGLE_APPLICATION_CREDENTIALS="/Users/dickhertz/dev/firestone-service-account/firestone-11f592c15c70.json"
export PATH="$HOME/.cargo/bin:$PATH"
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

##
## Cool colors to make terminal more fun.
##

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    MAGENTA=$(tput setaf 9)
    ORANGE=$(tput setaf 172)
    GREEN=$(tput setaf 190)
    PURPLE=$(tput setaf 141)
    WHITE=$(tput setaf 256)
  else
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

##
## Only show username / host if not default
##

function usernamehost() {
  if [ $USER != "$default_username" ]; then echo "${MAGENTA}$USER ${WHITE} "; fi
}

##
## Put the string "[bash] hostname::/full/directory/path"
## in the title bar using the command sequence
## \[\e]2;[bash] \h::\]$PWD\[\a\]
## Put the penultimate and current directory in the iTerm2 tab
## \[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]
##

PS1="\[\e]2;$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]${BOLD}\$(usernamehost)\[$GREEN\]\w\$(git_info)\[$WHITE\]\n\$ \[$RESET\]"

##
## Bob.
##
##                  ._rGDWM4KKW4mNmDGDWWmmL__
##                _r8\KMM48|/D844d\bK+d@Kb*VM8W_,
##              m@@Z88/K4548!,\7YK5((t\Y87)/)TM58j
##            :45K5D@)\G\Z,,5(-/-!)D,\DT`K/.(bN))ZG
##           d8@D@GZZ,-!L!K`,+D,-.T4K !;!NbL!8-8-(8|
##          WMK8K8Wq88N/VLVb\!8,.. 5W- t|!Zr)8!KK:K8m_
##         j@88KW4WMW8@888GMK`W5..!-W))\!|K8(W!D|G@DK8D;
##        |WM8W8G@!@8W8MK8b8W)GD|!b|4K4|N8W@G8MKW5WM@8GW!
##       .88@W8MWMM5PK@8G88@KKWK8Md48D@|VW88W8M8)+\888888L
##       :8Z@8@88VZZZZKNV58M8@W88K888@|dM8M(+f!- )-Z884((8,
##       K85K4MG)))))X(((5(*D@8DW8K8554(Y/)'!'--/!-(M8Z))8|
##       @D@8@)D((((!/\\\)\Y!/(5M4Z))\!'-.!`-! !/'\ 885(58|
##      |MMMKW5N)'!-',/!.`.\- !\\\'/,/,/- -.\ - -/--!8K!V8W
##      |8M58KDD)\`,\ -..` -,-/-`,-.-!.` !'/,/'/.-(-`W8/!88
##      |@8@WDK4!\!! -!---!-,(.((.\--\-`-!`-\.'/ !)!\V4((88
##      |8K8M5(())\-,'\`-/-!.---- /!!`!`- !\- -! -! -)8))8W
##      |88@88Xt!\!-!-. !-\-.-!`-`,--.'-'\-`/`,. !|-,K8Z/8@
##      |8@8@G)ZK-\` -,-,\.`,! /!--`/'-'!-./.-,-,))!-K8((8K
##      `8W8K5(D)\--\'\`-( ---!!!!/!`!/.-!--'!,\`((\!4WD)8@
##       888@GGZ((!("- )--'!/.---.'/'!'-'`!` -'-\)-.88K(8K
##      :(K88tNZ)-/jZmKLKK-/ -'/\-.`-/.'JjGGdJjJ,/K/ D8W\8b
##      VNVZ8)K@//Pf+fM888W!!-`-` --.',448@88+MZmG|! V8W8@/|
##      |DGZZ)DKV(.'\:__)Z)8/,'(!!`/,!rG)\!!.! -`+))!/W85(P
##      !8K(5(5q)))))7J\((5(4q'\-/-.\4(((/+\)))/!!((\ 88)G|
##      |GWG\)Z,`KW//88ND\8888(!! /j8ZDKDNMMM/44,/\)\ K84@;
##      !Z8Z//\'!\\.,GKq',|\N5|. -\//(Y' :MLN..M-")7 @WM5;
##      !KKK\((`-`- / ..\((/|V|-'\"'-!!\\//'!,\`!`(- 8Z8Z
##      `DGD)))`/./(\(\)))!!)Z/`!(` '!,\)))_(-\ -,'!!'K((K
##       4t(\(\'- /'!\\~!`.-\5;\'/"`.-! ,\'!'  - ! - N\8!
##       V!8\-/ '- -.`.- - -\N /-`- - -- - ',`-  ! .'-b\);
##       :'4;-)! --`. - ,!-';|.-(./,/`/'/'! .`  ',-!! b-T-
##        ((K`(\-'- !- . .!((/.-\-:-!`-/-` ,',' '.`\-!K /'
##        `\) )D!! - -  /))!G`.`!!`( /!)L/ - -` ',,) |`~'
##          ` /WZ, -' _f/|/!\!-,',-\-,P\`Kb,- --..(/,!
##           !(NZr/ /d\\\44MW(t-!/jW@T-\! DG/')//(((.!
##           /)8(K((((//GDZWG@GM445(`/!-,-T5K((K/D))-'
##           !(KD8G)\):8WK84W488D@\ ,-./!`,\NN))))Z//
##            DDZ|/-//4WW88848ZZ!`,,_j\DW8K8Z-!!!t5(-
##            VG)\b!-!.58P~!~\*+((++Y~\!8@P!\(\!!Z))'
##            `K/-D))!/)KMm.          .q45`-)-- /K(/
##            "K/(/--.+DDG8WD-\+-==/~/Z)\.',// K+/
##              K|/D!,'(5888KqL_/j::q!`\-,-..'-d8\'
##              !|//;- GM885((!-!)\!,\`-\.--- !DG'
##               5-((-\88@))D))J..(\\\)\,/- /-(Wt'
##               `|-\G88@~/4KKKDD))))7(!.-`,'/GK!
##        ,       `d888@!!DDGt!7/7/`\'\-.'-"MD!
##    .-._; -,    d5K4K!\(DZ)!',\-\\-',/'/'/KW~
##   /'jW8f d8\ .W8)GZ))\T((\/( !!!,-`.`.\!(W'
##  : 48ff j@8WjMZK4Z`KK(NZ)!) !,-,-/.'-\/=8'
##  _ ` .,/K888885W*  Y4G)KN/.!,,\-\.-,\rG@'
##  48@8W/ V(8K848Z    `NKWNK44(Zj)GGGG5Wf
##  `88KM4  88@88@        '~~~~YfM4M4Z+~
##   V888@) 5WM8P
##    M8Rob.M88f
##    `*88888*'
##      `YY~'
##

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


