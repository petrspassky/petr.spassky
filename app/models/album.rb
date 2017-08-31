class Album < ApplicationRecord
  belongs_to :site
  belongs_to :artist, optional: true

  has_many :album_models, dependent: :destroy
  has_many :site_models, through: :album_models
  has_many :models, through: :site_models

  delegate :title, :url, to: :site, prefix: true
  delegate :affiliate_id, :webmaster_account, to: :site, prefix: false
end
