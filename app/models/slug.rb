class Slug < ApplicationRecord
  belongs_to :link

  validates :path, presence: true,
                   uniqueness: true,
                   length: { within: 3..255, on: :create, message: "too long" }

  before_validation :generate_path

  def generate_path
    self.path = SecureRandom.alphanumeric(6) if self.path.nil? || self.path.empty?
    true
  end
end
