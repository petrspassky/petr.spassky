class FemjoyParser
  def initialize(site, data, latest = nil)
    @site = site
    @data = data
    @latest = latest
  end

  def perform
    json_data.each do |album_data|
      find_or_create_album(album_data)
    end
  end

  private

  attr_reader :site, :data

  def json_data
    @json_data ||= JSON.parse(data)
  end

  def find_or_create_album(album_data)
    site.albums.find_or_create_by!(album_attributes(album_data)) do |album|
      site_models = find_or_create_site_models(album_data['models'])
      site_models.each do |site_model|
        album.album_models.build(site_model: site_model)
      end
    end
  end

  def album_attributes(album_data)
    {
      artist: find_or_create_artist(album_data['artist']),
      title: album_data['title'],
      url: album_data['url'],
      cover_url: album_data['thumb'],
      date: album_data['date']
    }
  end

  def find_or_create_artist(name)
    return nil if name.blank?
    Artist.find_or_create_by!(name: name)
  end

  def find_or_create_site_models(names)
    names.split(', ').map do |name|
      site.site_models.find_by(nickname: name) || create_site_model(name)
    end
  end

  def create_site_model(name)
    model = Model.create!(name: name)
    site.site_models.create!(nickname: name, model: model)
  end
end
