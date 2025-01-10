function gcd --wraps='cd $(ghq list -p | peco)' --description 'alias gcd=cd $(ghq list -p | peco)'
  cd $(ghq list -p | peco) $argv
        
end
