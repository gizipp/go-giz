require "rails_helper"

RSpec.describe "Link", type: :request do

  it "creates a new Link and redirects to link url" do
    get "/https:/google.com"

    # expect(response).to render_template(:new)
    #
    # post "/widgets", :params => { :widget => {:name => "My Widget"} }
    #
    # expect(response).to redirect_to(assigns(:widget))
    # follow_redirect!
    #
    # expect(response).to render_template(:show)
    # expect(response.body).to include("Widget was successfully created.")
  end


  it "not creates a exist Link and redirects to link url" do
  end
end
