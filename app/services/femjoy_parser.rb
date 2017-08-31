class FemjoyParser
  def initialize(site, data, latest = nil)
    @site = site
    @data = data
    @latest = latest
  end

  def perform
    json_data.each do |album|
      create_album(album)
    end
  end

  private

  attr_reader :site, :data

  def json_data
    @json_data ||= JSON.parse(data)
  end

  def create_album(album_data)
    find_or_create_album(album_data)
  end

  def find_or_create_album(album_data)
    site.albums.find_or_create_by!(
      artist: find_or_create_artist(album_data['artist']),
      title: album_data['title'],
      url: album_data['url'],
      cover_url: album_data['thumb'],
      date: album_data['date']
    ) do |album|
      site_model = find_or_create_site_model(album_data['models'])
      album.album_models.build(site_model: site_model)
    end
  end

  def find_or_create_artist(name)
    Artist.find_or_create_by!(name: name)
  end

  def find_or_create_site_model(name)
    site.site_models.find_by(nickname: name) || create_site_model(name)
  end

  def create_site_model(name)
    model = Model.create!(name: name)
    site.site_models.create!(nickname: name, model: model)
  end
end
