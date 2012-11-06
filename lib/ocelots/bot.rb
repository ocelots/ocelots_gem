require 'cinch'
require 'ocelots'

module Ocelots::Bot
  include Ocelots

  def execute *args
    RiplWatir
    bot = Cinch::Bot.new do
      configure do |c|
        c.nick = args.shift
        c.server = args.shift
        c.port = args.shift.to_i
        c.channels = args
      end

      on :message, /^phone for (.+)$/ do |m, text|
        visit_page(:gab).search text
        phone = on_page(:gab).phone
        if phone
          m.reply "phone for #{text} is #{phone}"
        else
          m.reply "couldn't find a phone number for #{text} sorry"
        end
      end
    end
    bot.start
  end
end