#!/usr/bin/bash

USAGE=<<EOF
Please set $WEECHAT_HOME or create ~/.weechat/ to install.
EOF

if [ ! -z $WEECHAT_HOME ]; then
    cp notifym.pl $WEECHAT_HOME/perl/notifym.pl
elif [ -d $HOME/.weechat/ ]; then
    mkdir -p $HOME/.weechat/perl
    cp notifym.pl $HOME/.weechat/perl/notifym.pl
else
    echo $USAGE
    exit 1
fi
