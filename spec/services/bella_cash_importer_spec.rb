require 'rails_helper'

RSpec.describe BellaCashImporter do
  describe '#perform' do
    let(:html_data) { file_fixture('bellacash.html').read }
    let(:csv_data) { file_fixture('bellacash.csv').read }
    let(:parser) { instance_double(BellaCashParser) }

    subject(:service) { described_class.new }

    before do
      url = 'http://www.bellacash.com/genlist.php'
      params = {
        ccbill: described_class::AFFILIATE_ID,
        paysite: 'all',
        type: 'all',
        imagedisplay: 'normal',
        ex1: 'gallerylink',
        ex2: ';',
        ex3: 'gallerydesc',
        ex4: ';',
        ex5: 'sitename',
        ex6: ';',
        ex7: 'paysitelink',
        ex8: ';',
        ex9: 'dateadded',
        ex10: 'blank'
      }
      stub_request(:post, url).
        with(body: params).
        to_return(status: 200, body: html_data)
    end

    it 'calls parser' do
      expect(BellaCashParser).to receive(:new).with(csv_data).and_return(parser)
      expect(parser).to receive(:perform)

      service.perform
    end
  end
end
