class Model < ApplicationRecord
  has_many :site_models, dependent: :destroy
  has_many :sites, through: :site_models
  has_many :albums, -> { order(date: :desc) }, through: :site_models

  validates :name, presence: true

  def latest_album
    albums.first
  end
end
