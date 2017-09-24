class SitesController < ApplicationController
  def index
    @sites = Site.
             includes(:albums).
             order(:title).
             page(page).
             decorate
  end
end
