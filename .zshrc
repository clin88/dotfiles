export PATH=$(brew --prefix)/sbin:$(brew --prefix)/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=$PATH:$HOME/bin
export EDITOR=vim
export UBER_HOME="$HOME/Uber"
export UBER_OWNER="clin@uber.com"
export VAGRANT_DEFAULT_PROVIDER=aws
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
[ -s "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
# [ -s "$(brew --prefix)/etc/bash_completion" ] && . $(brew --prefix)/etc/bash_completion
[ -s "$HOME/.nvm/nvm.sh" ] && . $HOME/.nvm/nvm.sh

# settings from http://askubuntu.com/questions/1577/moving-from-bash-to-zsh
PS1='[%T] %n@%m:%~# '
REPORTTIME=10


HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory
setopt AUTO_PUSHD

autoload -U compinit
compinit

setopt completeinword
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

bindkey -v                                              # vim mode
bindkey '^R' history-incremental-search-backward        # history search in vim mode

autoload select-word-style
select-word-style shell

setopt interactivecomments # pound sign in interactive prompt
setopt auto_cd

# superglobs
setopt extendedglob

alias pycharm='open /Applications/PyCharm.app'
alias ll='ls -lG'
alias la='ls -aG'
alias ls='ls -FG'
alias ipn='ipython notebook --pylab=inline'
alias gen='python generate.py'
alias hq="history | grep"

# screenshot aliases
alias scf='defaults write com.apple.screencapture name'
alias scl='defaults write com.apple.screencapture location'

# PROMPT='[%n@%m:%c]%# ' # default prompt
RPROMPT='[%* on %D]' # prompt for right side of screen

