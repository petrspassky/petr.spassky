class AlbumsController < ApplicationController
  def index
    @albums = Album.limit(limit).offset(offset)
  end

  private

  def offset
    params[:offset] || 0
  end

  def limit
    params[:limit] || 20
  end
end
