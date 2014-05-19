
###################Second Section#############################
#others{{{
#允许在交互模式中试用注释
#cmd #这是注释
setopt INTERACTIVE_COMMENTS

#启动自动cd ,输入目录名则进入目录
setopt AUTO_CD

#扩展路径
#/v/c/p/p => /var/cache/pacman/pkg
setopt  complete_in_word

#禁用core dumps
limit coredumpsize 0 

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
#开启此选项,补全时会直接选中菜单项
setopt MENU_COMPLETE

autoload -Uz compinit
compinit

#We set some options here
#setopt extended_glob
setopt correctall
export HISTTIMEFORMAT='%F %T '
#less 语法高亮需要安装source-highlight
PAGER='less -X -M'

if [ -e "/usr/bin/apt-get" ]
then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
else
    export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi
export LESS=' -R '
################################add sudo#######################


sudo-command-line(){
 [[ -z $BUFFER ]] && zle up-history
 [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
#插入光表后,光表移动到行末尾
}
zle -N sudo-command-line
#Esc Esc 在命令前插入sudo
bindkey "\e\e" sudo-command-line


#man手册的颜色配置
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;37m") \
		LESS_TERMCAP_md=$(printf "\e[1;37m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[0;36m") \
			man "$@"
}

#zsh 命令带颜色
############################################################

#TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

#recolor-cmd() {
    #region_highlight=()
    #colorize=true
    #start_pos=0
    #for arg in ${(z)BUFFER}; do
        #((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
        #((end_pos=$start_pos+${#arg}))
        #if $colorize; then
            #colorize=false
            #res=$(LC_ALL=C builtin type $arg 2>/dev/null)
            #case $res in
                #*'reserved word'*)   style="fg=magenta,bold";;
                #*'alias for'*)       style="fg=cyan,bold";;
                #*'shell builtin'*)   style="fg=yellow,bold";;
                #*'shell function'*)  style='fg=green,bold';;
                #*"$arg is"*)         
                    #[[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                #*)                   style='none,bold';;
            #esac
            #region_highlight+=("$start_pos $end_pos $style")
        #fi
        #[[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
        #start_pos=$end_pos
    #done
#}

#check-cmd-self-insert() { zle .self-insert && recolor-cmd }
#check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

#zle -N self-insert check-cmd-self-insert
#zle -N backward-delete-char check-cmd-backward-delete-char
###########################################################################################
