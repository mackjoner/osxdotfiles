Liuerfire's Wiki World
======================

Tips
----

#### synaptics touchpad settings
>use **synclient**

    synclient -l
    synclient TapButton1=1
    synclient VertEdgeScroll=1

#### ubuntu开发及打包环境
    sudo apt-get install build-essential devscripts ubuntu-dev-tools debhelper dh-make diff patch cdbs quilt gnupg fakeroot lintian pbuilder piuparts

#### KDE下gvim，xterm最大化问题解决
>special window settings -> obey geometry restrictions -> focus -> no
 

#### git color output
    git config --global --add color.ui true

#### N卡6屏问题
在 `/etc/X11/Xorg.conf` 中 `Device`下加入：

    Option "ModeValidation" "NoTotalSizeCheck"

***
 
Gentoo Simple Installation Guide
--------------------------------

#### Some packages
    gentoo-sources, gentoolkit, ccache, syslog-ng
    python-updater
    revdep-rebuild
    编译内核

#### 更新gcc
    emerge -u gcc
    gcc-config -l
    gcc-config number
    env-update && source /etc/profile
    emerge --oneshot libtool
    revdep-rebuild --library libstdc++.so.7

#### 配置locale，网络神马的
    nano -w /etc/conf.d/hostname
    hostname="hostname"
    nano -w /etc/conf.d/net
    config_eth0="dhcp"
    cd /etc/init.d/
    ln -s net.lo net.eth0
    rc-update add net.eth0 default
    nano -w /etc/locale.gen
    nano -w /etc/env.d/02locale
    LANG="en_US.UTF-8"
    LC_COLLATE="C"

