function gh --wraps='hub browse $(ghq list | peco | cut -d "/" -f 2,3)' --description 'alias gh=hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
  hub browse $(ghq list | peco | cut -d "/" -f 2,3) $argv
        
end
