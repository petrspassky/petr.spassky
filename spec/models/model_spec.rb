require 'rails_helper'

RSpec.describe Model, type: :model do
  it { is_expected.to have_many(:site_models).dependent(:destroy) }
  it { is_expected.to have_many(:sites).through(:site_models) }
  it { is_expected.to have_many(:album_models).dependent(:destroy) }
  it { is_expected.to have_many(:albums).through(:album_models) }

  it { is_expected.to validate_presence_of :name }
end
