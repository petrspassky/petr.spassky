class Album < ApplicationRecord
  belongs_to :site
  belongs_to :artist
end
