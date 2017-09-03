class AlbumsController < ApplicationController
  def index
    @albums = base_scope.
              includes(:site, :site_models).
              order(date: :desc).
              limit(limit).
              offset(offset).
              decorate
  end

  private

  def base_scope
    model&.albums || Album.all
  end

  def model
    @model = Model.find_by(id: params[:model_id])
  end
end
