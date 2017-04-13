source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/mercurial", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

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
export GPG_TTY=$(tty)
export PYTHONSTARTUP=$HOME/.config/pythonstartup.py

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_compgen_path() {
    ag -g "" "$1"
}

export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.zsh_private ] && source ~/.zsh_private


export PATH="$HOME/.yarn/bin:$PATH"
