function gcode --wraps='code $(ghq list -p | peco)' --description 'alias gcode=code $(ghq list -p | peco)'
  code $(ghq list -p | peco) $argv
        
end
