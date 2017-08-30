require 'rails_helper'

RSpec.describe SiteModel, type: :model do
  it { is_expected.to belong_to(:site) }
  it { is_expected.to belong_to(:model) }

  it { is_expected.to have_many(:album_models).dependent(:destroy) }
  it { is_expected.to have_many(:albums).through(:album_models) }
end
