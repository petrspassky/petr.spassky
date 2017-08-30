class Model < ApplicationRecord
  has_many :site_models, dependent: :destroy
  has_many :sites, through: :site_models
  has_many :albums, through: :site_models

  validates :name, presence: true
end
