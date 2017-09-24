require 'csv'

class MoneyCultParser
  SITE_URL_TO_TITLE = {
    %r{\Ahttp://hosted.amourangels.com} => 'Amour Angels',
    %r{\Ahttp://hosted.showybeauty.com} => 'Showy Beauty',
    %r{\Ahttp://www.artnudegalleries.com} => 'Teen Art Club'
  }.freeze

  def initialize(data)
    @data = data
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

  def parse_row(row) # rubocop:disable MethodLength
    url, _short, _long, cover_url, title, models, _zip, date, artist = row
    find_or_create_artist(artist)
    site = site_by_url(url)
    site.albums.find_or_create_by!(
      url: url,
      title: title,
      cover_url: cover_url,
      date: parse_date(date)
    ) do |album|
      site_model = find_or_create_site_model(site, models)
      album.album_models.build(site_model: site_model)
    end
  end

  def parse_date(date)
    Date.parse(date)
  rescue ArgumentError, TypeError
    nil
  end

  def site_by_url(url)
    title = SITE_URL_TO_TITLE.find { |regex, _| regex =~ url }.last
    Site.find_by!(title: title)
  end

  def find_or_create_site_model(site, model)
    site.site_models.find_by(nickname: model) || create_site_model(site, model)
  end

  def create_site_model(site, name)
    model = Model.create!(name: name)
    site.site_models.create!(nickname: name, model: model)
  end

  def find_or_create_artist(artist)
    Artist.find_or_create_by(name: artist)
  end
end
