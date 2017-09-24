require 'rails_helper'

RSpec.describe BaseUrlWrapper do
  describe '#wrap' do
    let(:original_url) do
      'http://hosted.amourangels.com/hornyteenbreastspussy/4108/index.html'
    end

    subject(:service) do
      described_class.new
    end

    it 'wraps link with all the referral params' do
      expect(service.wrap(original_url)).to eq(original_url)
    end
  end
end
