require 'rails_helper'

RSpec.describe Slug, type: :model do
  it "is valid with valid attributes" do
    link = FactoryBot.build(:link)
    slug = link.slugs.build
    expect(slug).to be_valid
  end

  it "is not valid without link" do
    slug = Slug.new
    expect(slug).not_to be_valid
  end

  it "is generate path" do
    link = FactoryBot.create(:link)
    slug = link.slugs.create!
    expect(slug.path).to be_present
  end
end
