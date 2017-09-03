require 'rails_helper'

RSpec.describe Bcash4youImporter do
  describe '#perform' do
    let(:data) { file_fixture('bcash4you.csv').read }
    let(:parser) { instance_double(Bcash4youParser) }

    subject(:service) { described_class.new }

    before do
      login_url = 'http://www.bcash4you.com/'
      stub_request(:post, login_url).
        with(body: "username=#{described_class::AFFILIATE_ID}&loginsent=1").
        to_return(
          status: 302,
          headers: {
            'Set-Cookie': 'PHPSESSID=aqpvo45c0imu4bia6k62tud5c3; path=/'
          }
        )

      data_url = 'http://www.bcash4you.com/promotion/watch4beauty.com/fhg.csv'
      stub_request(:get, data_url).
        with(
          headers: {
            'Cookie': 'PHPSESSID=aqpvo45c0imu4bia6k62tud5c3'
          }
        ).
        to_return(
          status: 200,
          body: data
        )
    end

    it 'calls parser' do
      expect(Bcash4youParser).to receive(:new).with(data).and_return(parser)
      expect(parser).to receive(:perform)

      service.perform
    end
  end
end
