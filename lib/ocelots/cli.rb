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

  def antechamber team_slug
    from = 0
    while true
      messages = request_antechamber team_slug, from
      messages.reverse.each do |message|
        from = message['id']
        person = message['person']
        ts = Time.at message['timestamp'].to_i
        puts "#{ts.strftime('%d/%m %H:%M:%S')} #{person['full_name']}: #{message['content']}"
      end
      sleep 15
    end
  end
private
  def show response, field
    puts response[field.to_s] if response[field.to_s]
  end
end