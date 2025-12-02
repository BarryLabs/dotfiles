function ll --wraps=ls --wraps='eza --long --all' --description 'alias ll=eza --long --all'
    eza --long --all $argv
end
