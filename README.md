# Version: 1.1

Current version is 1.1. In case of questions, bugs,
feature ideas, please contact `mitescugeorgedan@gmail.com`
or use GitHub.

# How-to-install

Run `./install.sh` to install it in `~/.weechat/perl/`.

# Options

The following set of options are available:

* notify_pv `('on' or 'off')`

This option enables or disables notifications when
private messages are received.

Urgency: `critical`

* notify_mentions `('on' or 'off')`

This option enables or disables notifications when
your username is mentioned in a channel.

Urgency: `critical`

* notify_channels `('on' or 'off')`

This option enables or disables notifications when
a message is sent on one of your white-listed channels.

Urgency: `normal`

* notify_servers `('on' or 'off')`

This option enables or disables notifications when
a message is sent on one of your white-listes servers.

Urgency: `normal`

* channel_whitelist `(perl regex)`

This options uses a regex to identify the channels
from which you want to receive notifications.
* server_whitelist `(perl regex)`

This options uses a regex to identify the servers
from which you want to receive notifications.
