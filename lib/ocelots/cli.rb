require 'httparty'

module Ocelots::Cli
  def self.execute *args
    command, *args = *args
    send command, *args
  end

  def self.phone email
    persona_id = Digest::MD5.hexdigest email
    response = request "profiles/#{persona_id}"
    puts response['phone'] if response
  end
private
  def self.request command
    HTTParty.get "#{base_url}/api/#{command}?auth_token=#{ENV['AUTH_KEY']}"
  end

  def self.base_url
    ENV['OCELOTS_URL'] || 'http://ocelots.herokuapp.com'
  end
end