require 'cinch'
require 'ocelots'

module Ocelots::Bot
  include Ocelots

  def execute *args
    bot = Cinch::Bot.new do
        configure do |c|
        c.server = args.shift
        c.channels = args
      end

      on :message, "hello" do |m|
        m.reply "Hello, #{m.user.nick}"
      end

      on :message, /^phone for (.+)$/ do |m, email|
        response = request_profile email
        m.reply response['phone'] if response['phone']
      end
    end
    bot.start
  end
end