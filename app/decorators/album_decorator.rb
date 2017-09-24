class AlbumDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def date
    object.date&.to_s(:long)
  end

  def affiliated_url
    url_wrapper.wrap(object.url)
  end

  def affiliated_site_url
    url_wrapper.wrap(object.site_url)
  end

  private

  def url_wrapper
    UrlWrapperFactory.new(site).build
  end
end
