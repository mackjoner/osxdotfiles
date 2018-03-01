liuerfire_path="`dirname $0`"
#source $liuerfire_path/git.zsh
#source $liuerfire_path/theme-and-appearance.zsh
source $liuerfire_path/completion.zsh
source $liuerfire_path/aliases.zsh
#source $liuerfire_path/liuerfire.zsh-theme

fpath+="$liuerfire_path/cmdcompletion"

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

bindkey -e

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=1000000
SAVEHIST=1000000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
