require 'rails_helper'

RSpec.describe CcbillUrlWrapper do
  describe '#wrap' do
    let(:affiliate_id) { '2588917' }
    let(:webmaster_account) { '927141-0000' }
    let(:original_url) do
      'http://hosted.femjoy.com/galleries/15724532_bpf413_cok775'
    end

    subject(:service) do
      described_class.new(
        affiliate_id: affiliate_id,
        webmaster_account: webmaster_account
      )
    end

    it 'wraps link with all the referral params' do
      escaped_url = URI.escape("#{original_url}?affid=#{affiliate_id}", '?=:/')
      expected_url = 'http://refer.ccbill.com/cgi-bin/clicks.cgi?'\
                     "CA=#{webmaster_account}&"\
                     "PA=#{affiliate_id}&"\
                     "html=#{escaped_url}"

      expect(service.wrap(original_url)).to eq(expected_url)
    end
  end
end
