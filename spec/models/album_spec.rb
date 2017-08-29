require 'rails_helper'

RSpec.describe Album, type: :model do
  it { is_expected.to belong_to(:site) }
  it { is_expected.to belong_to(:artist) }

  it { is_expected.to have_many(:album_models).dependent(:destroy) }
  it { is_expected.to have_many(:models).through(:album_models) }
end
