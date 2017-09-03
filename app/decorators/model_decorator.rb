class ModelDecorator < Draper::Decorator
  delegate_all

  def latest_album
    object.latest_album.decorate
  end
end
