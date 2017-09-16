class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def offset
    [params[:offset].to_i, 0].max
  end

  def limit
    params[:limit] || 20
  end
end
