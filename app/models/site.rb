class Site < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :site_models, dependent: :destroy
  has_many :models, through: :site_models

  validates :title, presence: true
  validates :url, presence: true

  # FIXME: Remove hardcoded
  def affiliate_id # rubocop:disable Metrics/MethodLength
    ids = {
      'Femjoy' => FemjoyImporter::AFFILIATE_ID,
      'Joymii' => FemjoyImporter::AFFILIATE_ID,
      'AvaDawn.com' => BellaCashImporter::AFFILIATE_ID,
      'Bryci.com' => BellaCashImporter::AFFILIATE_ID,
      'KatieBanks.com' => BellaCashImporter::AFFILIATE_ID,
      'TaliaShepard.com' => BellaCashImporter::AFFILIATE_ID,
      'HunterLeigh.com' => BellaCashImporter::AFFILIATE_ID,
      'BellaNextDoor.com' => BellaCashImporter::AFFILIATE_ID,
      'JanaFox.com' => BellaCashImporter::AFFILIATE_ID,
      'CeceSeptember.com' => BellaCashImporter::AFFILIATE_ID,
      'IslaWhite.com' => BellaCashImporter::AFFILIATE_ID,
      'AlexisMonroe.com' => BellaCashImporter::AFFILIATE_ID,
      'MonroeLee.com' => BellaCashImporter::AFFILIATE_ID,
      'Watch4Beauty' => Bcash4youImporter::AFFILIATE_ID
    }
    ids[title]
  end

  # FIXME: Remove hardcoded
  def webmaster_account # rubocop:disable Metrics/MethodLength
    ids = {
      'Femjoy' => '927141-0000',
      'Joymii' => '927141-0000',
      'AvaDawn.com' => '911444-0000',
      'Bryci.com' => '911444-0000',
      'KatieBanks.com' => '911444-0000',
      'TaliaShepard.com' => '911444-0000',
      'HunterLeigh.com' => '911444-0000',
      'BellaNextDoor.com' => '911444-0000',
      'JanaFox.com' => '911444-0000',
      'CeceSeptember.com' => '911444-0000',
      'IslaWhite.com' => '911444-0000',
      'AlexisMonroe.com' => '911444-0000',
      'MonroeLee.com' => '911444-0000',
      'Watch4Beauty' => '930360-0000'
    }
    ids[title]
  end
end
