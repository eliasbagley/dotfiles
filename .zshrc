# launch tmux
alias tmux="tmux -2" # to fix vim colors
if [ "$TMUX" = "" ]; then tmux; fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
DEFAULT_USER="eliasbagley"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting ruby rails jump brew bundler encode64 osx pow rand-quote rvm terminalapp vi-mode web-search xcode history zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/eliasbagley/.rvm/gems/ruby-2.1.0/bin:/Users/eliasbagley/.rvm/gems/ruby-2.1.0@global/bin:/Users/eliasbagley/.rvm/rubies/ruby-2.1.0/bin:/Users/eliasbagley/Library/androidsdk/platform-tools:/Users/eliasbagley/Library/androidsdk/tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/eliasbagley/.rvm/bin"

#RVM path

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

 # make cd behave as pushd
 setopt auto_pushd
 alias  po='popd'
 alias please='sudo'
 alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
 alias editrc="vim ~/.zshrc"
 alias kotlin="kotlinc-jvm"
 # use nvim by default
 alias vim="nvim"

 # save history across sessions
 #setopt inc_append_history
 #setopt share_history

 # turn on vi mode
bindkey -v

# zsh vi mode has some oddities. Fix them by rebinding common keys
bindkey "^R" history-incremental-search-backward
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" kill-line
bindkey "^P" up-history
bindkey "^N" down-history

# source the fzf functions
source ~/.fzf.zsh
# kill process
fkill() {
      ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-15}
}
fkillnow() {
      ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

# custom shortcut scrips for postgres

function db_start()
{
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
}

function db_stop()
{
    pg_ctl -D /usr/local/var/postgres stop -s -m fast
}

function db_connect()
{
    psql -h localhost crm_dev
}

ZSH_HIGHLIGHT_STYLES[alias]='fg=077'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=122'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=123'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'bold,bg=white')

# print a quote
#quote

# http://ku1ik.com/2012/05/04/scratch-dir.html
# Create a new scratch directory
function scratch {
  cur_dir="$HOME/scratch"
  new_dir="$HOME/tmp/scratch-`date +'%s'`"
  mkdir -p $new_dir
  ln -nfs $new_dir $cur_dir
  cd $cur_dir
  echo "New scratch dir ready >"
}

# fasd
eval "$(fasd --init auto)"
alias v='f -e vim' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-o
alias j='z' #remap j to fasd jump

#for macports
path=(/opt/local/{bin,sbin} $path)

#local scripts
path=(~/bin $path)

# source autoenv
source /usr/local/opt/autoenv/activate.sh

# tmuxinator TODO: not currently working
#export EDITOR='vim'
#source ~/.bin/tmuxinator.zsh

# setting java home
export JAVA8_HOME="$(/usr/libexec/java_home -v 1.8)"
export JAVA7_HOME="$(/usr/libexec/java_home -v 1.7)"

export GITHUB_TOKEN=edf83771611730c78121fe17ad82a98bbcec5fe2

alias fixgeny='sudo /Library/Application\ Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh restart'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# xcode is retarted and gives <<error type>> errors on code completion sometimes. This might fix it
alias clearModuleCache='rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache'
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData'
