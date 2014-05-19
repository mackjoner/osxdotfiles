zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect: lines: %L matches: %M [%p]'

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete_correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

#路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::completion:*' '\\'

#彩色补全菜单
eval $(dircolors -b)
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#kill命令补全
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' fore-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

#命令补全
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options'  description 'yes'
zstyle ':completion:*:options'  auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m '
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warings' format $'\e[01;31m -- No Match Found -- \e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d(errors: %e) -- \e[0m'

#cd  ~补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'name-directories' 'path-directories' 'users' 'expand'

