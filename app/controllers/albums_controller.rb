class AlbumsController < ApplicationController
  def index
    @albums = base_scope.
              includes(:site, :site_models).
              order('date IS NULL, date DESC').
              page(page).
              decorate
  end

  private

  def base_scope
    model&.albums || site&.albums || Album.all
  end

  def model
    @model = Model.find_by(id: params[:model_id])
  end

  def site
    @site = Site.find_by(id: params[:site_id])
  end
end
