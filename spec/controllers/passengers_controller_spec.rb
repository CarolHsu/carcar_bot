require 'rails_helper'

RSpec.describe PassengersController, type: :request do

  it "should return if avlie" do
    get '/passengers/is_alive'
    expect(response).to have_http_status(:ok)
  end
  
  describe '#dialog' do

    xit 'should new a @client of line bot api' do
    end

    xit "should have dialog" do
      post '/passengers/dialog'
      expect(response).to have_http_status(:ok)
    end
    
  end

  describe '#set_user_info' do

    xit 'should store user_id into Passenger #line_user_id' do
      
    end
    
  end

  describe '#include_key_word?' do
    xit 'should break if events size more than 1' do
      
    end
    xit 'should break if event is not message' do
      
    end
    xit 'should break if event type is not text' do
      
    end
    xit 'should break if the key word does not belong to any service' do
      
    end
    xit 'should start dialog when the key word belongs to any service' do
      
    end
  end

  describe '#is_first_time_follow?' do
    xit 'should check is the user first time to follow' do
      
    end
  end

  describe '#say_i_dont_know' do
    xit 'should reply i don\'t know' do
      
    end
  end

end
