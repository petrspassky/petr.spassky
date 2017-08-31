class FemjoyImporter
  # TODO: move to config
  BASE_URL = 'cash.femjoy.com'.freeze
  AFFILIATE_ID = '2588917'.freeze

  def initialize(models = 100)
    @models = models
  end

  def perform
    data = Net::HTTP.get(BASE_URL, path)
    site = Site.find_by(title: 'Femjoy')
    FemjoyParser.new(site, data).perform
  end

  private

  attr_reader :models

  def path
    File.join(
      '/export/c1/galleries',
      models.to_s,
      fields.join(','),
      '[]/json',
      URI.escape(params.to_json),
      AFFILIATE_ID
    )
  end

  def fields
    %w[models title url artist archive date thumb]
  end

  def params
    {
      s: 'date-desc',
      r: {
        galleries: {
          s: 'cover2_384x384'
        }
      }
    }
  end
end
