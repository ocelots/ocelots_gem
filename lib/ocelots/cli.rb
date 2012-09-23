require 'ocelots'

module Ocelots::Cli
  include Ocelots

  def execute *args
    command, *args = *args
    send command, *args
  end

  def profile email
    response = request_profile email
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
end