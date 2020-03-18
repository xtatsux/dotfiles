# ------------------------------------------------------------------------------------------------------------
# - * File: dot.zshrc
# - * Author: tatsu
# ------------------------------------------------------------------------------------------------------------

# eval
export EDITOR='code'
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

export PATH="/usr/local/opt/qt/bin:$HOME/.nodebrew/current/bin:/usr/local/heroku/bin:/Users/tatsu/.rvm/gems/ruby-1.9.3-p545@rails3tutorial2ndEd/bin:/Users/tatsu/.rvm/gems/ruby-1.9.3-p545@global/bin:/Users/tatsu/.rvm/rubies/ruby-1.9.3-p545/bin:/Users/tatsu/.pythonbrew/bin:/Users/tatsu/.pythonbrew/pythons/Python-2.7.2/bin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/googkit/bin:/Users/tatsu/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export GOPATH=$HOME
export GHQ_ROOT=$HOME/src
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.cargo/bin:$PATH

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
 HISTFILE=~/.zsh_history
 HISTSIZE=10000000
 SAVEHIST=10000000
 setopt hist_ignore_dups     # ignore duplication command history list
 setopt share_history        # share command history data

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export EDITOR=subl
eval "$(direnv hook zsh)"

fpath=(/usr/local/share/zsh-completions $fpath)

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

PERL_MB_OPT="--install_base \"/Users/tatsu/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/tatsu/perl5"; export PERL_MM_OPT;

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tatsu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tatsu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tatsu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tatsu/google-cloud-sdk/completion.zsh.inc'; fi
