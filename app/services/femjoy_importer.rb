class FemjoyImporter
  # TODO: move to config
  BASE_URL = 'cash.femjoy.com'.freeze
  AFFILIATE_ID = '2588917'.freeze

  def initialize(site: 'Femjoy', albums: 100)
    @site = Site.find_by(title: site)
    @albums = albums
  end

  def perform
    data = Net::HTTP.get(BASE_URL, path)
    FemjoyParser.new(site, data).perform
  end

  private

  attr_reader :site, :albums

  def path
    File.join(
      '/export',
      site_code,
      'galleries',
      albums.to_s,
      fields.join(','),
      '[]/json',
      URI.escape(params.to_json),
      AFFILIATE_ID
    )
  end

  def site_code
    codes = {
      'Femjoy' => 'c1',
      'Joymii' => 'c2'
    }
    codes[site.title]
  end

  def fields
    %w[models title url artist archive date thumb]
  end

  def params
    {
      s: 'date-desc',
      r: {
        galleries: {
          s: site_cover
        }
      }
    }
  end

  def site_cover
    covers = {
      'Femjoy' => 'cover2_384x384',
      'Joymii' => 'r-578x325'
    }
    covers[site.title]
  end
end
