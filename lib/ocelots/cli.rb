require 'httparty'

module Ocelots::Cli
  def execute *args
    command, *args = *args
    send command, *args
  end

  def profile email
    persona_id = Digest::MD5.hexdigest email
    response = request "profiles/#{persona_id}"
    if response
      show response, :full_name
      show response, :phone
      show response, :photo_url
    end
  end
private
  def show response, field
    puts response[field.to_s] if response[field.to_s]
  end

  def request command
    HTTParty.get "#{base_url}/api/#{command}?auth_token=#{ENV['OCELOTS_AUTH_TOKEN']}"
  end

  def base_url
    ENV['OCELOTS_URL'] || 'http://ocelots.herokuapp.com'
  end
end