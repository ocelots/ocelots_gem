require 'httparty'

module Ocelots
  def request_profile email
    request "profiles/#{Digest::MD5.hexdigest email}"
  end

  def request command
    HTTParty.get "#{base_url}/api/#{command}?auth_token=#{ENV['OCELOTS_AUTH_TOKEN']}"
  end

  def base_url
    ENV['OCELOTS_URL'] || 'http://ocelots.herokuapp.com'
  end
end