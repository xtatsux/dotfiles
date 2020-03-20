# ------------------------------------------------------------------------------------------------------------
# - * File: dot.zshrc
# - * Author: tatsu
# ------------------------------------------------------------------------------------------------------------

# XDG Base Directory Specification
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.share

# data directory for zsh
ZDOTDIR=$XDG_DATA_HOME/zsh

# eval
export EDITOR='code'
export PAGER='less'

# eval for direnv
eval "$(direnv hook zsh)"

# alias
alias gcd='cd $(ghq list -p | peco)'
alias gh='gh-open $(ghq list -p | peco)'
alias coder='code -r'
alias gcode='code $(ghq list -p | peco)'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# path settings
export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man
export GHQ_ROOT=$XDG_DATA_HOME/src
export GOPATH=$XDG_DATA_HOME/go
export CARGO_HOME=$XDG_CACHE_HOME/cargo
export MPLCONFIGDIR=$XDG_CACHE_HOME/matplotlib
export HUB_CONFIG=$XDG_CONFIG_HOME/hub/hub
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
typeset -U path PATH
export PATH=$XDG_DATA_HOME/bin:$GOPATH/bin:$CARGO_HOME/bin:/usr/local/opt/python3/libexec/bin:/usr/local/sbin:/usr/local/bin:$PATH

#export PATH="/usr/local/opt/qt/bin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/googkit/bin"

#Option #{{{2
 setopt auto_cd
 setopt auto_pushd
 setopt correct
 setopt list_packed
 setopt nonomatch
 setopt EXTENDED_GLOB

 #perfect complement
 autoload -U compinit
 compinit

 #HistoryOption #{{{1

 # Settings history search
 # Ctrl-p for back-forward search,Ctrl-n for looking-forward search
 autoload history-search-end
 zle -N history-beginning-search-backward-end history-search-end
 zle -N history-beginning-search-forward-end history-search-end
 bindkey "^P" history-beginning-search-backward-end
 bindkey "^N" history-beginning-search-forward-end

 # Settings history save
 HISTFILE=$ZDOTDIR/.zsh_history
 HISTSIZE=10000000
 SAVEHIST=10000000
 setopt hist_ignore_dups     # ignore duplication command history list
 setopt share_history        # share command history data
 setopt append_history extended_history hist_no_store hist_reduce_blanks hist_verify hist_ignore_space inc_append_history

fpath=(${ZDOTDIR:-$HOME}/zsh-completions $fpath)

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tatsu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tatsu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tatsu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tatsu/google-cloud-sdk/completion.zsh.inc'; fi
