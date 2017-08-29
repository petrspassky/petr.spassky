class Album < ApplicationRecord
  belongs_to :site
  belongs_to :artist

  has_many :album_models, dependent: :destroy
  has_many :models, through: :album_models
end
