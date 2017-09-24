require 'rails_helper'

RSpec.describe SiteDecorator do
  describe '#url' do
    let(:site) { FactoryGirl.build_stubbed(:site, affiliate_program: nil) }
    let(:wrapped_url) { BaseUrlWrapper.new.wrap(site.url) }

    subject(:decorated) { described_class.decorate(site) }

    it 'wraps url' do
      expect(decorated.url).to eq(wrapped_url)
    end
  end
end
