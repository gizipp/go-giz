class LinksController < ApplicationController
  def show_by_slug
    @link = Link.find_by_slug(params[:slug]) if params[:slug].present?

    if @link && @link.update_attribute(:slug_clicked, @link.slug_clicked + 1)
      return redirect_to @link.url
    end

    render 'errors/404', status: 404
  end

  def show_by_url
    if params[:url] && params[:url].include?('http')
      url = params[:url].gsub(":/","://")
      @link = Link.find_by_url(url) || Link.shorten(url)
      @link.update_attribute(:url_clicked, @link.url_clicked + 1)
      return redirect_to @link.url
    end

    render 'errors/404', status: 404
  end
end
