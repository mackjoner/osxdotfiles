alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

alias capturescreen='scrot -t 20 -d 5'
alias mpscreen='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot'
alias convmid3='find -iname "*.mp3" -execdir mid3iconv -e GBK {} \;'
alias pip_upgrade="pip list | awk '{print \$1}' | xargs pip install -U"
alias pip3_upgrade="pip3 list | awk '{print \$1}' | xargs pip3 install -U"
alias py3_env='source ~/.pyenv/py3/bin/activate'
