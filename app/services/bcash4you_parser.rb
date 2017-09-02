require 'csv'

class Bcash4youParser
  def initialize(data, latest = nil)
    @data = data
    @latest = latest
  end

  def perform
    csv_data.each do |row|
      parse_row(row)
    end
  end

  private

  attr_reader :data

  def csv_data
    CSV.parse(data, col_sep: ';')
  end

  def parse_row(row)
    url, name, nickname, _zip = row
    site.albums.find_or_create_by!(
      url: clean_site_url(url),
      title: name,
      cover_url: cover_image_url(url),
      date: Time.zone.today
    ) do |album|
      site_model = find_or_create_site_model(nickname || name)
      album.album_models.build(site_model: site_model)
    end
  end

  def site
    @site ||= Site.find_by(title: 'Watch4Beauty')
  end

  def find_or_create_site_model(name)
    site.site_models.find_by(nickname: name) || create_site_model(name)
  end

  def create_site_model(name)
    model = Model.create!(name: name)
    site.site_models.create!(nickname: name, model: model)
  end

  def clean_site_url(url)
    URI.join(URI(url), '.').to_s
  end

  def cover_image_url(url)
    URI.join(URI(url), 'cover-large.jpg').to_s
  end
end
