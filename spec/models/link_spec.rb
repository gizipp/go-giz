require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid with valid attributes" do
    link = Link.new
    link.url = "https://gizipp.com"
    expect(link).to be_valid
  end

  it "is not valid without url" do
    link = Link.new
    link.url = nil
    expect(link).to_not be_valid
  end

  it "is not valid with url non https/http" do
    link = Link.new
    link.url = 'gizipp.com'
    expect(link).to_not be_valid
  end

  context ".crawl_and_create" do
    it "rescue crawl and return nil" do
      link = Link.crawl_and_create('https://nonexistest.com')
      expect(link).to be_nil
    end

    it "crawl and return link" do
      link = Link.crawl_and_create('https://gizipp.com')
      expect(link.status_code).to eq('200')
      expect(link).to eq(Link.last)
    end
  end

  context "#before_validation" do
    it "is generate a slug" do
      link = Link.new
      link.url = "https://gizipp.com"
      link.save!
      expect(link.slug).to be_present
    end
  end
end
