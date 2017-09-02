class AlbumsController < ApplicationController
  def index
    @albums = Album.
              includes(:site, :site_models).
              order(date: :desc).
              limit(limit).
              offset(offset).
              decorate
  end

  private

  def offset
    params[:offset] || 0
  end

  def limit
    params[:limit] || 20
  end
end
