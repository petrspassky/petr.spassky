class ModelDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def latest_album
    object.latest_album.decorate
  end
end
