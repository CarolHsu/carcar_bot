require 'line/bot'
class PassengersController < ApplicationController
  before_action :get_current_passenger

  def reply
    set_passenger_line_user_id unless @passenger
    message = dialog_generator
    answer(message)
    head :ok
  end

  private

  def get_current_passenger
    create_line_client
    @passenger = Passenger.find_by(line_user_id: @line_user_id)
  end

  def set_passenger_line_user_id
    @passenger = Passenger.create(line_user_id: @line_user_id)
  end

  def create_line_client
    @client = Line::Bot::Client.new do |client|
      config.channel_secret = Figaro.env.channel_secret
      config.channel_token = Figaro.env.channel_token
    end
    parse_params
  end
  
  def parse_params
    event = params[:events].first
    @line_user_id = event[:source][:userId]
    @reply_token = event[:replyToken]
    @message = event[:message][:text].strip
  end

  def dialog_generator
    Dialog::Passenger::Base.new(@passenger, @message)
  end

  def answer(message)
    @client.reply_message(@reply_token, message)
  end
end
