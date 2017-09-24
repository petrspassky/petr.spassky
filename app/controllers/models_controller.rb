class ModelsController < ApplicationController
  def index
    @models = Model.
              includes(:site_models, albums: :site).
              order(:name).
              page(page).
              decorate
  end
end
