require 'rails_helper'

RSpec.describe AlbumModel, type: :model do
  it { is_expected.to belong_to :album }
  it { is_expected.to belong_to :site_model }
end
