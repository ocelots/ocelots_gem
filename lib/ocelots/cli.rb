require 'httparty'

module Ocelots::Cli
  def execute *args
    command, *args = *args
    send command, *args
  end

  def phone email
    persona_id = Digest::MD5.hexdigest email
    response = request "profiles/#{persona_id}"
    puts response['phone'] if response
  end
private
  def request command
    HTTParty.get "#{base_url}/api/#{command}?auth_token=#{ENV['AUTH_TOKEN']}"
  end

  def base_url
    ENV['OCELOTS_URL'] || 'http://ocelots.herokuapp.com'
  end
end