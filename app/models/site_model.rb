class SiteModel < ApplicationRecord
  belongs_to :site
  belongs_to :model

  has_many :album_models, dependent: :destroy
  has_many :albums, through: :album_models
end
