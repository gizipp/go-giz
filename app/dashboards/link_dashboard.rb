require "administrate/base_dashboard"

class LinkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    url: Field::String,
    url_clicked: Field::Number,
    slug: Field::String,
    slug_clicked: Field::Number,
    title: Field::String,
    description: Field::String,
    author: Field::String,
    image: Field::String,
    status_code: Field::String,
    scheme: Field::String,
    host: Field::String,
    checked_at: Field::DateTime,
    custom_data: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  url
  url_clicked
  slug
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  url
  url_clicked
  slug
  slug_clicked
  title
  description
  author
  image
  status_code
  scheme
  host
  checked_at
  custom_data
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  url
  url_clicked
  slug
  slug_clicked
  title
  description
  author
  image
  status_code
  scheme
  host
  checked_at
  custom_data
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how links are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(link)
  #   "Link ##{link.id}"
  # end
end
