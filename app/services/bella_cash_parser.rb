require 'csv'

class BellaCashParser
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
    url, description, site_name, site_link, date_str = row
    site = find_or_create_site(site_name, site_link)
    date = Time.at(date_str.to_i).to_date

    find_or_create_album(site: site,
                         url: url,
                         date: date,
                         description: description)
  end

  def find_or_create_album(site:, url:, date:, description:)
    site.albums.find_or_create_by!(
      title: description,
      url: url,
      cover_url: first_image_url(url),
      date: date
    ) do |album|
      site_model = find_or_create_site_model(site, site.title)
      album.album_models.build(site_model: site_model)
    end
  end

  def find_or_create_site_model(site, name)
    site.site_models.find_by(nickname: name) || create_site_model(site, name)
  end

  def create_site_model(site, name)
    model = Model.create!(name: name)
    site.site_models.create!(nickname: name, model: model)
  end

  def find_or_create_site(name, url)
    Site.find_or_create_by!(title: name, url: site_url(url))
  end

  # http://www.bellagals.com/avadawn/girly/index.php?ccbill=2589061
  # ->
  # http://www.bellagals.com/avadawn/girly/tn_01.jpg
  def first_image_url(url)
    URI.join(URI(url), 'tn_01.jpg').to_s
  end

  # http://www.bellagals.com/avadawn/girly/index.php?ccbill=2589061
  # ->
  # http://www.bellagals.com/
  def site_url(url)
    URI.decode_www_form(URI(url).query).to_h['HTML']
  end
end
