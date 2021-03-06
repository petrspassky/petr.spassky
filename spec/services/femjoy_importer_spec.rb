require 'rails_helper'

RSpec.describe FemjoyImporter do
  describe '#perform' do
    let(:data) { file_fixture('femjoy.json').read }
    let(:parser) { instance_double(FemjoyParser) }

    context 'for Femjoy' do
      let(:site) { FactoryGirl.create :site, title: 'Femjoy' }

      subject(:service) { described_class.new(site: 'Femjoy', albums: 2) }

      before do
        url = <<~URL.delete("\n")
          http://cash.femjoy.com/export/c1/galleries/2/
          models,title,url,artist,archive,date,thumb/
          %5B%5D/json/
          %7B%22s%22:%22date-desc%22,%22r%22:%7B%22galleries%22:%7B%22s%22:%22cover2_384x384%22%7D%7D%7D/
          #{described_class::AFFILIATE_ID}
        URL
        stub_request(:get, url).to_return(status: 200, body: data)
      end

      it 'calls parser' do
        expect(FemjoyParser).to receive(:new).
          with(site, data).
          and_return(parser)
        expect(parser).to receive(:perform)

        service.perform
      end
    end

    context 'for Joymii' do
      let(:site) { FactoryGirl.create :site, title: 'Joymii' }

      subject(:service) { described_class.new(site: 'Joymii', albums: 2) }

      before do
        url = <<~URL.delete("\n")
          http://cash.femjoy.com/export/c2/galleries/2/
          models,title,url,artist,archive,date,thumb/
          %5B%5D/json/
          %7B%22s%22:%22date-desc%22,%22r%22:%7B%22galleries%22:%7B%22s%22:%22r-578x325%22%7D%7D%7D/
          #{described_class::AFFILIATE_ID}
        URL
        stub_request(:get, url).to_return(status: 200, body: data)
      end

      it 'calls parser' do
        expect(FemjoyParser).to receive(:new).
          with(site, data).
          and_return(parser)
        expect(parser).to receive(:perform)

        service.perform
      end
    end
  end
end
