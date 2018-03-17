require 'rails_helper'

RSpec.describe PassengersController, type: :controller do

  let(:passenger) { create(:passenger) }
  let(:line_response) do
    {
      "events"=>[
        {
          "replyToken"=>"00000000000000000000000000000000", 
          "type"=>"message", 
          "timestamp"=>1515423877419, 
          "source"=>{
            "type"=>"user", 
            "userId"=>passenger.line_user_id
          }, 
          "message"=>{
            "id"=>"100001", 
            "type"=>"text", 
            "text"=>"Hello, world"
          }
        }
      ]
    }
  end

  describe '#reply' do

    context 'when seccess' do

      xit 'should reply status :ok' do
        post :reply, params: line_response
        expect(response).to have_http_status(:ok)
      end

      context 'new passenger' do

        xit 'should set passenger information if not existed' do
          allow(controller).to receive(:set_passenger_line_user_id)
          expect(controller).to receive(:set_passenger_line_user_id)
          post :reply, params: new_user_params
        end
        
      end
      
    end

  end

  describe '#get_current_passenger' do

    it 'should call #create_line_client' do
      allow(controller).to receive(:create_line_client)
      expect(controller).to receive(:create_line_client)
      controller.send(:get_current_passenger)
    end

    it 'should return current @passenger' do
      allow(controller).to receive(:create_line_client)
      controller.instance_variable_set(:@line_user_id, passenger.line_user_id)
      expect(controller.send(:get_current_passenger)).to eq(passenger)
    end
    
  end

  describe '#set_passenger_line_user_id' do
    
    xit 'should set passenger line_user_id' do
      
    end

    xit 'should set passenger phone number' do
      
    end
    
  end

  describe '#create_line_client' do

    it 'should new a @client of Line::Bot::Client' do
      allow(controller).to receive(:parse_params)
      controller.send(:create_line_client)
      expect(controller.instance_variable_get(:@client)).not_to be_nil
    end
    
  end

  describe '#get_event' do

    before :each do
      controller.params = ActionController::Parameters.new line_response
      controller.send(:parse_params)
    end

    it 'should get @line_user_id' do
      expect(controller.instance_variable_get(:@line_user_id)).to eq(passenger.line_user_id)
    end

    it 'should get @reply_token' do
      expect(controller.instance_variable_get(:@reply_token)).to eq(controller.params[:events].first[:replyToken])
    end
    
  end

  describe '#dialog_generator' do

    xit 'should generate the reply for current status' do
      
    end
    
  end

  describe '#answer' do

    let(:message) { "whatever" }
    let(:reply_token) { line_response["events"].first["replyToken"] }
    let(:client) { instance_double(Line::Bot::Client) }

    before :each do
      controller.instance_variable_set(:@client, client)
      controller.instance_variable_set(:@reply_token, reply_token)
    end

    it 'should #answer message to passenger' do
      allow(client).to receive(:reply_message).with(reply_token, message)
      expect(client).to receive(:reply_message).with(reply_token, message)
      controller.send(:answer, message)
    end
    
  end

end
