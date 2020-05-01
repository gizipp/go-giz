require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET home#index" do
    it "show homepage" do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET home#about" do
    it "show about page" do
      get '/about'
      expect(response).to have_http_status(200)
    end
  end
end
