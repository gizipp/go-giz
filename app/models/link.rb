class Link < ApplicationRecord
  has_many :slugs

  validates :url, presence: true, format: URI::regexp(%w[http https])

  after_create :create_first_slug

  def slug
    slugs.primary
  end

  def self.find_by_slug(slug)
    slug = Slug.find_by_path(slug)
    return slug.link if slug
  end

  private

  def create_first_slug
    slugs.create!
  end
end
