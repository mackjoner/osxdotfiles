source ~/.zplug/init.zsh
zplug 'zplug/zplug'

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "lib/git", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/mercurial", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh

#zplug "liuerfire/my-zsh-config/", use:init.zsh
zplug "~/Projects/dotfiles/zsh", from:local, use:init.zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

export CLICOLOR=1
export PYTHONSTARTUP=$HOME/.config/pythonstartup.py

BASE16_SHELL="$HOME/OpenSource/base16-shell/base16-summerfruit.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_compgen_path() {
    ag -g "" "$1"
}

[ -f ~/.zsh_private ] && source ~/.zsh_private

