require 'httparty'
require 'cgi'

module Ocelots
  def request_profile email
    get "profiles/#{Digest::MD5.hexdigest email}"
  end

  def request_antechamber team_slug, from
    get "antechamber/#{team_slug}", from: from
  end

  def post_antechamber team_slug, content
    post "antechamber/#{team_slug}", body: {content: content}, headers: {'ContentType' => 'application/json'}
  end

  def get command, params
    HTTParty.get url_for command, params
  end

  def post command, params
    HTTParty.post url_for(command), params
  end

  def url_for command, params={}
    params[:auth_token] = ENV['OCELOTS_AUTH_TOKEN']
    "#{base_url}/api/#{command}?#{params.map{ |k,v| "#{k}=#{CGI.escape v.to_s}" }.join('&')}"
  end

  def base_url
    ENV['OCELOTS_URL'] || 'http://ocelots.herokuapp.com'
  end
end