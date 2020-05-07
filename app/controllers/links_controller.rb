class LinksController < ApplicationController
  before_action :set_url_or_slug
  before_action :set_link

  def show;end

  private

  def set_url_or_slug
    @url_or_slug = if params[:url].include?('http')
      params[:url].gsub(":/","://")
    else
      params[:url]
    end
  end

  def set_link
    @link = Link.find_by_url(@url_or_slug) ||
            Link.find_by_slug(@url_or_slug) ||
            Link.crawl_and_create(@url_or_slug)

    @links = Link.where(host: [@url_or_slug, @link.host])
                 .where.not(id: @link.id)
  end
end
