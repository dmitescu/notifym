# How-to-install

Run `./install.sh` to install it in `~/.weechat/perl/`.

# Options

The following set of options are available:

* notify_pv `('on' or 'off')`
This option enables or disables notifications when
private messages are received.
* notify_mentions `('on' or 'off')`
This option enables or disables notifications when
your username is mentioned in a channel.
* notify_channels `('on' or 'off')`
This option enables or disables notifications when
a message is sent on one of your white-listed channels.
* notify_servers `('on' or 'off')`
This option enables or disables notifications when
a message is sent on one of your white-listes servers.
* channel_whitelist `(perl regex)`
This options uses a regex to identify the channels
from which you want to receive notifications.
* server_whitelist `(perl regex)`
This options uses a regex to identify the servers
from which you want to receive notifications.
