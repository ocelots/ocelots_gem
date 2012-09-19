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

Set environment variable AUTH_TOKEN with your auth token from ocelots.

Override the default url (http://ocelots.herokuapp.com) with your own instance by setting the OCELOTS_URL environment variable.

You should now be ready to roll:

    ocelots phone user@mail.com

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request