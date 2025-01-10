eval "$(/opt/homebrew/bin/brew shellenv)"

# XDG Base Directory Specification
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache
set -x XDG_DATA_HOME ~/.share

# eval
set -x EDITOR 'code'
set -x PAGER 'less'

# eval for direnv
eval "$(direnv hook fish)"

# path settings
set -x MANPATH /usr/local/share/man:/usr/local/man:/usr/share/man
set -x GOPATH $XDG_DATA_HOME/go
set -x CARGO_HOME $XDG_CACHE_HOME/cargo
set -x MPLCONFIGDIR $XDG_CACHE_HOME/matplotlib
set -x HUB_CONFIG $XDG_CONFIG_HOME/hub/hub
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -x AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -x AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -x PATH $PATH $XDG_DATA_HOME/bin:$GOPATH/bin:$CARGO_HOME/bin:/usr/local/opt/python3/libexec/bin:/usr/local/sbin:/usr/local/bin:$PATH:~/command

#eval for ghq
set -g GHQ_SELECTOR fzf
set -g GHQ_SELECTOR_OPTS "--no-sort --reverse --ansi --color bg+:13,hl:3,pointer:7"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
    bind \c] peco_select_ghq_repository
    bind \cx\cr peco_recentd
end

function on_exit --on-event fish_exit
    echo fish is now exiting
    echo bye for now!
end

starship init fish | source
source /opt/homebrew/opt/asdf/libexec/asdf.fish
