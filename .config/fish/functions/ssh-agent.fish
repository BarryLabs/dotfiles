function y --wraps=ssh-agent --wraps='ssh-agent' --description 'alias ssh-agent=eval \$(ssh-agent -c)'
    eval \$(ssh-agent -c) $argv
end
