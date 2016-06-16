
# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}on%{$reset_color%} git:%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[cyan]%}o"

# Mercurl info
local hg_info='$(hg_prompt_info)'
ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[blue]%}on%{$reset_color%} hg:%{$fg_bold[blue]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_HG_PROMPT_CLEAN=" %{$fg[cyan]%}o"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="%{$terminfo[bold]$fg[blue]%}%{$reset_color%}\
%{$fg[yellow]%}%n\
%{$fg[white]%} at \
%{$fg[green]%}$HOST \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[red]%}${current_dir}%{$reset_color%}\
${git_info} \
${hg_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

