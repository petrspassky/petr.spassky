require 'rails_helper'

RSpec.describe AlbumDecorator do
  subject(:decorated) { described_class.new(album) }

  describe '#date' do
    let(:album) do
      FactoryGirl.build_stubbed(:album, date: '2012-12-12')
    end

    it { expect(decorated.date).to eq('December 12, 2012') }
  end

  context 'for non-ccbill affiliated site' do
    let(:site) { FactoryGirl.build_stubbed(:site, affiliate_program: '') }
    let(:album) do
      FactoryGirl.build_stubbed(:album, site: site)
    end

    describe '#affiliated_url' do
      it 'wraps url' do
        expect(decorated.affiliated_url).to eq(album.url)
      end
    end

    describe '#affiliated_site_url' do
      it 'wraps url' do
        expect(decorated.affiliated_site_url).to eq(site.url)
      end
    end
  end

  context 'for ccbill affiliated site' do
    let(:site) { FactoryGirl.build_stubbed(:site, affiliate_program: 'ccbill') }
    let(:album) do
      FactoryGirl.build_stubbed(:album, site: site)
    end

    describe '#affiliated_url' do
      it 'wraps url' do
        expected_url = CcbillUrlWrapper.new(
          affiliate_id: site.affiliate_id,
          webmaster_account: site.webmaster_account
        ).wrap(album.url)
        expect(decorated.affiliated_url).to eq(expected_url)
      end
    end

    describe '#affiliated_site_url' do
      it 'wraps url' do
        expected_url = CcbillUrlWrapper.new(
          affiliate_id: site.affiliate_id,
          webmaster_account: site.webmaster_account
        ).wrap(site.url)
        expect(decorated.affiliated_site_url).to eq(expected_url)
      end
    end
  end
end
