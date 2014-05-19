setopt correctall
#错误矫正
zstyle ':completion:*' completer _complete _math _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
