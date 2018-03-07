require 'line/bot'
class PassengersController < ApplicationController
  def is_alive
    head :ok
  end

  def dialog
    @client = Line::Bot::Client.new { |config|
      config.channel_secret = Figaro.env.channel_secret
      config.channel_token = Figaro.env.channel_token
    }
    events = client.parse_events_from(params)
    set_user_info(events) if is_first_time_follow?(events)
    say_i_dont_know(events) unless include_key_word?(events)
    head :ok
  end

  private
  def set_user_info(events)
    event = events.first
    passenger =  Passenger.new
    passenger.line_user_id = event.source.user_id
    passenger.save
  end

  def is_first_time_follow?(events)
    event = events.first
    if event.type == "follow" and event.source.type == "user"
      user_id = event.source.user_id
      true unless Passenger.where(line_user_id: user_id).any?
    end
    false
  end

  def include_key_word?(events)
    return unless events.size == 1
    event = event.first
    return unless event == Line::Bot::Event::Message
    return unless event.type == Line::Bot::Event::MessageType::Text
    key_word = event.message['text']
    return unless DEFAULT_SERVICES.values.include? key_word

    service = DEFAULT_SERVICES[key_word]
    dialog = Dialog::Passenger::Base.new(service)
    dialog.start
  end

  def say_i_dont_know(events)
    reply_token = events.first['replyToken']
    @client.reply_message(reply_token, 'sorry... I can not understand :(')
  end
end
