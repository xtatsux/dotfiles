# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.share/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------------------------------------
# - * File: dot.zshrc
# - * Author: tatsu
# ------------------------------------------------------------------------------------------------------------

# XDG Base Directory Specification
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.share

# data directory for zsh
export ZDOTDIR=$XDG_DATA_HOME/zsh

# eval
export EDITOR='code'
export PAGER='less'

# eval for direnv
eval "$(direnv hook zsh)"

# alias
alias gcd='cd $(ghq list -p | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias coder='code -r'
alias gcode='code $(ghq list -p | peco)'
alias ls='eza -l -g --icons'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# path settings
export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man
export GOPATH=$XDG_DATA_HOME/go
export CARGO_HOME=$XDG_CACHE_HOME/cargo
export MPLCONFIGDIR=$XDG_CACHE_HOME/matplotlib
export HUB_CONFIG=$XDG_CONFIG_HOME/hub/hub
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
typeset -U path PATH
export PATH=$XDG_DATA_HOME/bin:$GOPATH/bin:$CARGO_HOME/bin:/usr/local/opt/python3/libexec/bin:/usr/local/sbin:/usr/local/bin:$PATH:~/command

# Option #{{{2
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nonomatch
setopt EXTENDED_GLOB

# perfect complement
autoload -U compinit
compinit
# Match lowercase letters to uppercase with completion.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#Colored list of candidate completions
zstyle ':completion:*' list-colors ''
fpath=(${ZDOTDIR:-$HOME}/zsh-completions $fpath)

# Activate Plugin
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# HistoryOption #{{{1

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

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tatsu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tatsu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tatsu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tatsu/google-cloud-sdk/completion.zsh.inc'; fi

#. /usr/local/opt/asdf/asdf.sh
#eval "$(isengardcli shell-profile)"

# To customize prompt, run `p10k configure` or edit ~/.share/zsh/.p10k.zsh.
[[ ! -f ~/.share/zsh/.p10k.zsh ]] || source ~/.share/zsh/.p10k.zsh
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
. /opt/homebrew/opt/asdf/libexec/asdf.sh
source ~/.config/op/plugins.sh
