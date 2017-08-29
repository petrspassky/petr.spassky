class Site < ApplicationRecord
  has_many :site_models, dependent: :destroy
  has_many :models, through: :site_models

  validates :title, presence: true
  validates :url, presence: true
end
