require 'rails_helper'

RSpec.describe UrlWrapperFactory do
  describe '#build' do
    context 'for cbill site' do
      let(:site) do
        FactoryGirl.build_stubbed(:site,
                                  affiliate_program: 'ccbill',
                                  affiliate_id: '2588917',
                                  webmaster_account: '927141-0000')
      end

      subject(:factory) { described_class.new(site) }

      it 'builds ccbill url wrapper' do
        expect(factory.build).to be_instance_of(CcbillUrlWrapper)
      end
    end

    context 'for other site' do
      let(:site) do
        FactoryGirl.build_stubbed(:site, affiliate_program: '')
      end

      subject(:factory) { described_class.new(site) }

      it 'builds ccbill url wrapper' do
        expect(factory.build).to be_instance_of(BaseUrlWrapper)
      end
    end
  end
end
