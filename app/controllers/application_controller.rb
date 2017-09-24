class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def page
    [params[:page].to_i, 0].max
  end
end
