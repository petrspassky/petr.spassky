require 'rails_helper'

RSpec.describe SiteModel, type: :model do
  it { is_expected.to belong_to(:site) }
  it { is_expected.to belong_to(:model) }
end
