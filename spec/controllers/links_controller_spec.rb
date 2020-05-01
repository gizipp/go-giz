require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  describe "GET links#show" do

    it "redirect to link" do
      expect(response).to have_http_status(200)
    end

    context "non-exist link" do
      it "create new link"
    end

    context "exist link" do
      it "not create link"
    end

    it "add clicked count"
  end
end
