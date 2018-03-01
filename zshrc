

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

bindkey -e

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_compgen_path() {
    ag -g "" "$1"
}
export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.zsh_private ] && source ~/.zsh_private

PATH="$HOME/.cargo/bin:$HOME/go/bin:$PATH"
export PATH

alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

#less 语法高亮需要安装source-highlight
PAGER='less -X -M'

if [ -e "/usr/bin/apt-get" ]; then # ubuntu
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [ -e "/usr/local/bin/src-hilite-lesspipe.sh" ]; then # Mac OS X
    export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
else # Arch
    export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi
export LESS=' -R '

export GPG_TTY=$(tty)
typeset -U PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
