# Path to your oh-my-zsh installation.
export ZSH=/Users/ahmadawais/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cobalt2"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zs="source ~/.zshrc"
alias zso="subl ~/.zshrc"
alias stgc="st ~/.gitconfig"


# cd related
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# QUICK FOLDERS
alias html="cd /Users/ahmadawais/html"
alias dot="cd /Users/ahmadawais/dotFiles"
alias gtest="cd /Users/ahmadawais/gtest"
alias dfiles="cd /Users/ahmadawais/dotFiles"

function gstreak(){
 cd /Users/ahmadawais/websites/git_test_repo/wpdev ;
 python file.py "$*"
}

# Projects I am working on
alias wt="cd /Users/ahmadawais/html/writablehtml.dev"



# Removes dotfile or dotfolder in the pwd e.g. .git
alias deldot="rm -rf .*"
# Removes everything in pwd
alias delpwd="rm -rf "$(pwd -P)"/*"

# trash is better
alias tdot="t .*"
alias tpwd="t "$(pwd -P)"/*"
alias ta="tdot ; tpwd"


# GIT
alias g="git"
alias gi="git init"
alias gco="git checkout"
alias go='git checkout'
alias gb="git branches"
alias gbd="git branch -D"
#create new branch and checkout
alias gbn='git checkout -b'

#git clone realted
alias gcl="git clone"

# show contributors by commits
alias gcontributors="git shortlog -sn"

# git commit count
alias gccount="git rev-list HEAD --count"

#remove local branch
function gbdel {
  git branch -D "$1"
}
#delete remote branch
function gbrdel {
  git push origin :"$1"
}

#get a list of conflicts
alias conflicts='git diff --name-only --diff-filter=U'

function gammend(){
  git rebase -i @~"$*"
}

alias gref="git reflog"
alias greset="git reset $@"

alias grs="git remotes"
alias ghist="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"

alias gsclear="git stash clear"
alias gfo="git fetch origin"
alias grh="git reset --hard"
alias gromg="git reset --hard origin/master"
# reset to head and remove all untracked files (including npm installs)
alias gitreseteverything='git clean -d -x -f; git reset --hard'


alias gcdf="git clean -d -f"
alias gbrename="git branch -m"

alias gst="git status"
alias gss="git status -s"
alias gsb="git status -sb"

alias lg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(red)%h%C(reset) —— %C(bold blue)%an%C(reset): %C(white)%s%C(reset) %C(dim white)  %C(bold green)(%ar)%C(reset) %C(bold yellow)%d%C(reset)' --all"
alias lg2="git log --graph --abbrev-commit --decorate --format=format:'%C(red)%h%C(reset) —— %C(bold blue)%an%C(reset): %C(white)%s%C(reset) %C(dim white)  %C(bold green)(%ar)%C(reset) %C(bold yellow)%d%C(reset)' --all"

alias gad="git add ."
alias gc="git ci -m"
alias gcmall="git add . && git cm"
function gcma() {
    gcmall "$*"
}

alias gp="git push"
alias gpf="git push --force"

# git add all, git commit with the message and git push
# git commit all push
function gcmap() {
    gcmall "$*" && gp
}

alias gpsuom="git push --set-upstream origin master"
alias gpsuo="git push --set-upstream origin"
alias gpdt="git push --delete origin"
alias grao="git remote add origin"

# Git fethc & Pull
alias gf="git fetch"
alias gpl="git pull"
alias gfp="git fetch && git pull"

# Type `git open` to open the GitHub page or website for a repository.
# npm install -g git-open
alias gio="git open"

# git diff last commit
alias gd1="git diff HEAD^"

# git diff word diffing
alias gdw="git diff --word-diff"

# Fun commit messages
alias yolo="git commit -am '`curl -s http://whatthecommit.com/index.txt`'"
alias yoloo="git commit -am '`curl -s http://whatthecommit.com/index.txt`' && git push origin master --force"

# Open the pwd in the finder
alias o="open ."

# SVN related
# https://wordpress.org/plugins/about/svn/
alias s="svn"
alias sst="svn st"
alias sci="svn ci -m"


# Add SVN tag
# Usage: stag tags/1.0
alias stag="svn cp trunk"
#  SVN revert deletes added folders which are not commited but only added
alias sr="svn revert $@ --depth infinity"

# SVN revert everything like reset hard
alias sra="svn st  | grep '!' | sed 's/!M      \(.*\)$/"\1"/' | xargs svn revert --depth infinity"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# All the dig info
alias dig="dig +nocmd any +multiline +noall +answer"


# List ALL files (colorized() in long format, show permissions in octal
alias la="ls -l | awk '
{
  k=0;
  for (i=0;i<=8;i++)
    k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));
  if (k)
    printf(\"%0o \",k);
  printf(\" %9s  %3s %2s %5s  %6s  %s %s %s\n\", \$3, \$6, \$7, \$8, \$5, \$9,\$10, \$11);
}'"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Enable aliases to be sudo’ed
# alias sudo='sudo '

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'



# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}
# cd Shortcuts
alias des="cd Desktop"

# Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm /private/var/vm/sleepimage"

# yes I occasionally 127.0.0.1 twitter.com ;)
alias hosts='sudo subl /etc/hosts'

alias cask='brew cask' # i <3 u cask
# alias where=which # sometimes i forget
alias brwe=brew  #typos

# brew install speedtest-cli
alias sts='speedtest-cli --share'
alias stss='speedtest-cli --simple --share'

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Recursively delete `.DS_Store` files
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias killchrome="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
alias relaod="reload" #typo addressed
alias reld="reload"


alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'";

alias vup="vagrant up && vagrant provision && vagrant ssh"
alias vp="vagrant provision"
alias vs='sites && vagrant ssh'
alias vag="vagrant"

alias bell='echo "\a"'

alias cdate='date "+%d—%m—%Y"'

#tree structures
alias ll1="tree --dirsfirst -ChFL 1"
alias ll2="tree --dirsfirst -ChFL 2"
alias ll3="tree --dirsfirst -ChFL 3"
alias ll4="tree --dirsfirst -ChFupDaL 1"
alias ll5="tree --dirsfirst -ChFupDaL 2"
alias ll6="tree --dirsfirst -ChFupDaL 3"

#show hidden files and everything
alias lla="ll -a"


alias pc='phpcs --standard="WordPress" $@'
alias pcf='phpcbf --standard="WordPress" $@'
alias pcfall='find . | grep .php | xargs phpcbf --standard="WordPress"'

alias rl="release-it"

# NPM Quickes   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Npm
alias n='npm'

# Search Packages
alias n:='npm search'

# Install
alias ni='npm install'
alias nis='sudo npm install'

# Install Globally
alias nig='npm install -g'

# Install Globally and Save
alias nigs="npm install -g $@ --save"

# Install and Save
alias niss="npm install $@ --save"

# npm-check to update npm packages https://www.npmjs.com/package/npm-check
alias ncupg='sudo npm-check -g -u'
alias ncup='sudo npm-check -u'

# Fix Issues --Hard
function nf() {
  rm -rf ./node_modules;
  npm clear cache;
  npm clean cache;
  npm install;
}

# Fix Issues
function nfh() {
  npm clear cache;
  npm clean cache;
}

alias t="trash"

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
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract sublime web-search svn npm bower brew composer wpcli emoji)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
# setopt RM_STAR_WAIT


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# include z rupa
. ~/z.sh

#
# [functions]{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
#
# colors from tput
# http://stackoverflow.com/a/20983251/950111
# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1
#
# tput setab [1-7] # Set the background colour using ANSI escape
# tput setaf [1-7] # Set the foreground colour using ANSI escape
# tput sgr0    # Reset text format to the terminal's default
# tput bel     # Play a bell
#
# Usage:
# red=`tput setaf 1`
# green=`tput setaf 2`
# reset=`tput sgr0`
# echo "${red}red text ${green}green text${reset}"

blackf=`tput setaf 0` #set foreground black
greenb=`tput setab 2` # set background green
blueb=`tput setab 4` # set background blue
redb=`tput setab 1` # set background red
whiteb=`tput setab 7` # set background white
whitef=`tput setaf 7` # set foreground white
reset=`tput sgr0`     # reset to defaults

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}


# git checkout branch
function gcb() {
  git fetch
    git checkout -b $@ origin/$@
}


# checks if pwd is empty or not
function dirempty() {
  # DIR=pwd
  # look for empty dir
  if [ "$(ls -A $(pwd -P))" ]; then
       echo "$(pwd -P) is NOT Empty"
  else
      echo "$(pwd -P) is Empty"
  fi
  # rest of the logic
}


# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}


# Create a git.io short URL
function gitio() {
  if [ -z "${1}" -o -z "${2}" ]; then
    echo "Usage: \`gitio slug url\`"
    return 1
  fi
  curl -i http://git.io/ -F "url=${2}" -F "code=${1}"
}


# git clone repo . i.e. inside current directory
# usage: gclhere GitRepoURL
# Equal to rm -rf .* && rm -rf "$(pwd -P)"/* && git clone "$*" .
#
# TODO: Caution! This is a dangerous function and needs to be debugged, it deleted
# pwd's parent folders files. So it should not do that, it should delete the pwd and
# recreate it instead.
function gclhere() {

  echo "${whitef}———————————————————${reset}"
  echo "${whiteb} ${blackf}0. Initializing...${reset}"

  #if not empty
  if [ "$(ls -A $(pwd -P))" ]; then

    echo "${redb} ${blackf}1. PWD is not empty, let's delete it...${reset}"

    # PWD variable
    aa_pwd=$PWD
    # go back
    cd ..
    # trash the old PWD where git repo needs to be cloned
    trash $aa_pwd
    # recreate the old PWD and cd in it
    mkdir $aa_pwd && cd $aa_pwd

    echo "${redb} ${blackf}2. PWD deleted and recreated...${reset}"
    echo "${blueb} ${whitef}3. Starting git repo clone...${reset}"

    git clone "$*" .
    echo "${greenb} ${blackf}4. Git repo cloned. DONE!${reset}"

  # if empty
  else

    echo "${blueb} ${whitef}1. Directory is empty. Cloning the repo...${reset}"

    echo "${blueb} ${whitef}2. Starting git repo clone...${reset}"
    git clone "$*" .
    echo "${greenb} ${blackf}3. Git repo cloned! DONE!${reset}"

  fi

  echo "${whitef}———————————————————${reset}"

}


function emptypwd() {

 echo "${whitef}———————————————————${reset}"
   echo "${whiteb} ${blackf}0. Initializing...${reset}"

   #if not empty
   if [ "$(ls -A $(pwd -P))" ]; then

     echo "${redb} ${blackf}1. PWD is not empty, let's delete it...${reset}"

     # PWD variable
     aa_pwd=$PWD
     # go back
     cd ..
     # trash the old PWD where git repo needs to be cloned
     trash $aa_pwd
     # recreate the old PWD and cd in it
     mkdir $aa_pwd && cd $aa_pwd

     echo "${greenb} ${blackf}2. PWD deleted and recreated!!!${reset}"

   # if empty
   else

     echo "${greenb} ${blackf}1. Directory is already empty!!!${reset}"

   fi

   echo "${whitef}———————————————————${reset}"

}
