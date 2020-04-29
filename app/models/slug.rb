class Slug < ApplicationRecord
  belongs_to :link

  scope :primary,   -> { where(primary: true).first }
  scope :primaries, -> { where(primary: true) }

  validates :path, presence: true,
                   uniqueness: true,
                   length: { within: 3..255, on: :create, message: "too long" }

  before_validation :generate_path
  before_create :unprimary_other_slugs!

  private
  def generate_path
    self.path = SecureRandom.alphanumeric(6) if path.nil? || path.empty?
    true
  end

  def unprimary_other_slugs!
    link.slugs
        .primaries
        .where.not(id: id)
        .update_all(primary: false)
  end
end
