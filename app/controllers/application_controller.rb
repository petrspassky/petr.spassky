class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def offset
    params[:offset] || 0
  end

  def limit
    params[:limit] || 20
  end
end
