class Link < ApplicationRecord
  has_many :slugs

  validates :url, presence: true, format: URI::regexp(%w[http https])
end
