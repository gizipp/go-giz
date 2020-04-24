require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid with valid attributes" do
    link = Link.new
    link.url = "https://google.com"
    expect(link).to be_valid
  end

  it "is not valid without url" do
    link = Link.new
    link.url = nil
    expect(link).to_not be_valid
  end

  it "is not valid with url non https/http" do
    link = Link.new
    link.url = 'google.com'
    expect(link).to_not be_valid
  end
end
