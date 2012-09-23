# Ocelots

Library and command line wrapper for ocelots api.

## Installation

Add this line to your application's Gemfile:

    gem 'ocelots'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ocelots

## Usage

Set environment variable OCELOTS_AUTH_TOKEN with your auth token from ocelots.

Override the default url (http://ocelots.herokuapp.com) with your own instance by setting the OCELOTS_URL environment variable.

You should now be ready to roll:

    ocelots phone user@mail.com

You can also run an irc bot that will answer basic queries in a channel:

    ocelots_bot 'irc.freenode.org' '#channel'

At this stage, the bot will respond to a message to look up a phone number:

    phone for user@mail.com

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request