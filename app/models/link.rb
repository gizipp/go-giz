class Link < ApplicationRecord
  validates :url,  presence: true,
                   uniqueness: true,
                   format: URI::regexp(%w[http https])

  validates :slug, presence: true,
                   uniqueness: true,
                   length: {
                     within: 3..255,
                     on: :create,
                     message: "too long"
                   }

  before_validation :generate_slug

  def self.crawl_and_create(url)
    begin
      page = MetaInspector.new(url, connection_timeout: 5,
                                    read_timeout: 3,
                                    retries: 2)
    rescue MetaInspector::TimeoutError, MetaInspector::RequestError
      nil
    else
      Link.create!(
        url: url,
        title: page.best_title,
        description: page.best_description,
        author: page.best_author,
        image: page.images.best,
        status_code: page.response.status,
        scheme: page.scheme,
        host: page.host,
        checked_at: Time.current,
        custom_data: {
          raw_metainspector: page,
          raw_meta: page.meta
        }
      )
    end
  end

  private

  def generate_slug
    self.slug = SecureRandom.alphanumeric(6) if slug.nil? || slug.empty?
    true
  end
end
