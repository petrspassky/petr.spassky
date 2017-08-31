require 'rails_helper'

RSpec.describe AlbumDecorator do
  let(:site) { FactoryGirl.build_stubbed(:site) }
  let(:album) do
    FactoryGirl.build_stubbed(:album, site: site, date: '2012-12-12')
  end

  subject(:decorated) { described_class.new(album) }

  describe '#date' do
    it { expect(decorated.date).to eq('December 12, 2012') }
  end

  describe '#affiliated_url' do
    it 'wraps url' do
      expected_url = CcbillUrlWrapper.new(
        affiliate_id: site.affiliate_id,
        webmaster_account: site.webmaster_account,
        url: album.url
      ).perform
      expect(decorated.affiliated_url).to eq(expected_url)
    end
  end

  describe '#affiliated_site_url' do
    it 'wraps url' do
      expected_url = CcbillUrlWrapper.new(
        affiliate_id: site.affiliate_id,
        webmaster_account: site.webmaster_account,
        url: site.url
      ).perform
      expect(decorated.affiliated_site_url).to eq(expected_url)
    end
  end
end
