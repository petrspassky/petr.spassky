require 'rails_helper'

RSpec.describe Album, type: :model do
  it { is_expected.to belong_to(:site) }
  it { is_expected.to belong_to(:artist) }
end
