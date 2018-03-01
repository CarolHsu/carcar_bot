Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :controller => "passengers", :path => "/passengers" do
    get "/is_alive" => :is_alive
    post "/dialog" => :dialog
  end
end
