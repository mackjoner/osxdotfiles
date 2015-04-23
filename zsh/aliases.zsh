alias da='du -sch'
alias vim='nocorrect vim'

alias capturescreen='scrot -t 20 -d 5'
alias mpscreen='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot'
alias convmid3='find -iname "*.mp3" -execdir mid3iconv -e GBK {} \;'
alias default_env='source ~/py_env/default/bin/activate'
alias douban_env='source ~/py_env/douban/bin/activate'
alias pip_upgrade="pip list | awk '{print \$1}' | xargs pip install -U"
