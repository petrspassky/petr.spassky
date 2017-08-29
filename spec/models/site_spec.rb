require 'rails_helper'

RSpec.describe Site, type: :model do
  it { is_expected.to have_many(:site_models).dependent(:destroy) }
  it { is_expected.to have_many(:models).through(:site_models) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:url) }
end
