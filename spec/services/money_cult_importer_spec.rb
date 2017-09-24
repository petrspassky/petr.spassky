require 'rails_helper'

RSpec.describe MoneyCultImporter do
  describe '#perform' do
    let(:html_data) { file_fixture('money_cult.html').read }
    let(:csv_data) { file_fixture('money_cult.csv').read }
    let(:parser) { instance_double(MoneyCultParser) }

    subject(:service) { described_class.new(listkeys: ['15-22-0']) }

    before do
      url = 'http://www.moneycult.com/cgi-bin/fhgmanager/manager.cgi'
      params = {
        module: 'login',
        uname: 'xMamrGNhG9',
        pass: 'Bir5enqM6g'
      }
      stub_request(:post, url).
        with(body: params).
        to_return(
          status: 200,
          headers: {
            'Set-Cookie': 'sida=c4f2fb2cb9ef250c621c64dc7039a899; path=/'
          }
        )

      params = {
        module: 'basic',
        l: '1',
        mode: '0',
        wizardstep: '0',
        wizard: '0',
        scid: '0',
        vid: '0',
        algn: '2',
        data1: '1',
        data2: '2',
        data3: '3',
        data4: '4',
        data5: '5',
        data6: '6',
        data7: '7',
        data8: '8',
        data9: '9',
        delimiter: '%3B',
        selpage: '10000',
        period: '0',
        listkey: '15-22-0',
        sida: 'c4f2fb2cb9ef250c621c64dc7039a899'
      }
      query_string = params.map { |k, v| "#{k}=#{v}" }.join('&')
      stub_request(:get, "#{url}?#{query_string}").
        to_return(status: 200, body: html_data)
    end

    it 'calls parser' do
      expect(MoneyCultParser).to receive(:new).with(csv_data).and_return(parser)
      expect(parser).to receive(:perform)

      service.perform
    end
  end
end
