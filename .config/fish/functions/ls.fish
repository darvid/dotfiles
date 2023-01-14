function ls --wraps=lsd --wraps='ls-go -ila' --description 'alias ls=ls-go -ila'
  ls-go -ila $argv; 
end
