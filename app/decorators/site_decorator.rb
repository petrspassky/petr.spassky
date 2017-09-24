class SiteDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def url
    url_wrapper.wrap(object.url)
  end

  private

  def url_wrapper
    UrlWrapperFactory.new(object).build
  end
end
