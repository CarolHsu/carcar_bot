require 'rails_helper'

RSpec.describe PassengersController, type: :request do

  it "should return if avlie" do
    get '/passengers/is_alive'
    expect(response).to have_http_status(:ok)
  end
  
  it "should have dialog" do
    post '/passengers/dialog'
    expect(response).to have_http_status(:ok)
  end

end
