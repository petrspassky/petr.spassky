class Site < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :site_models, dependent: :destroy
  has_many :models, through: :site_models

  validates :title, presence: true
  validates :url, presence: true

  # FIXME: Remove hardcoded
  def affiliate_id
    '2588917'
  end

  # FIXME: Remove hardcoded
  def webmaster_account
    '927141-0000'
  end
end
