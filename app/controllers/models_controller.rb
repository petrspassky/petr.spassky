class ModelsController < ApplicationController
  def index
    @models = Model.
              includes(:site_models, { albums: :site }).
              order(:name).
              limit(limit).
              offset(offset).
              decorate
  end
end
