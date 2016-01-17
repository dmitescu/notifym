#
# Copyright (c) 2016 Mitescu George Dan <mitescugeorgedan@gmail.com>
# Copyright (c) 2016 Berechet Mihai <mihaibereket9954@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

my $SCRIPT_NAME = "notifym";
my $VERSION = "0.1";

#use Data::Dumper;

weechat::register($SCRIPT_NAME, "dmitescu", $VERSION, "GPL3", 
		  "Script which uses libnotify to alert the user about certain events.",
		  "", "");

my %options_def = ( 'notify_pm'        => ['on',     'Notify on private message.'],
		    'notify_mention'   => ['on',     'Notify on mention in channel.'],
		    'notify_server'    => ['off',    'Notify for every message coming from a server.'],
		    'server_whitelist' => ['*',      'The servers from which you desire to receive notifications.']
    );

my %options = ();

# Initiates options if non-existent and loads them
sub init {
    foreach my $opt (keys %options_def) {
	if (!weechat::config_is_set_plugin($opt)) {
	    weechat::config_set_plugin($opt, $options_def{$opt}[0]);
	}
	$options{$opt} = weechat::config_get_plugin($opt);
	weechat::config_set_desc_plugin($opt, $options_def{$opt}[1]
					. " (default: \"" . $options_def{$opt}[0]
					. "\")");
    }
}

# On update option, load it into the hash
sub update_config_handler {
    my ($data, $option, $value) = @_;
    $name = substr($option, 
		   length("plugins.var.perl.".$SCRIPT_NAME."."), 
		   length($option));
    $options{$name} = $value;
    # weechat::print("", $name . " is now " . $value . "!");
    return weechat::WEECHAT_RC_OK;
}

# Function to send notification
sub send_notification {
    my ($urgency, $summary, $body) = @_;
    my $retval = system("notify-send -u $urgency \"$summary\" \"$body\"");
}

# Handlers for signals :
# Private message

sub private_message_handler {
    my ($data, $signal, $signal_data) = @_;
    # my @pta = split(":", $signal_data);
    # weechat::print("", Dumper(\%options));
    my $hash_in = {"message" => $signal_data};
    my $hash_data = weechat::info_get_hashtable("irc_message_parse", $hash_in);
    my $nick = $hash_data->{"nick"};
    my $text = $hash_data->{"text"};
    # weechat::print("", Dumper($hash_data));
    send_notification("normal", "$nick says:", "$text");
    return weechat::WEECHAT_RC_OK;
}

# Main execution point

init();
send_notification("critical", "Starting NotifyM plugin!", "");
weechat::hook_config("plugins.var.perl." . $SCRIPT_NAME . ".*",
		     "update_config_handler", "");
weechat::hook_signal("irc_pv", "private_message_handler", "");
