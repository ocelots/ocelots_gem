require 'cinch'
require 'ocelots'

module Ocelots::Bot
  include Ocelots

  def execute *args
    bot = Cinch::Bot.new do
        configure do |c|
        c.nick = args.shift
        c.server = args.shift
        c.port = args.shift.to_i
        c.channels = args
      end

      on :message, /^phone for (.+)$/ do |m, email|
        response = request_profile email
        if response['phone']
          m.reply "phone for #{email} is #{response['phone']}"
        else
          m.reply "couldn't find a phone number for #{email} sorry"
        end
      end
    end
    bot.start
  end
end