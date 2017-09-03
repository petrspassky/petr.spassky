require 'rails_helper'

RSpec.describe ModelDecorator do
  describe '#latest_album' do
    let(:album) { FactoryGirl.build_stubbed(:album) }
    let(:model) { instance_double(Model, latest_album: album) }

    subject(:decorated) { described_class.new(model) }

    it 'returns decorated object' do
      expect(decorated.latest_album).to be_instance_of(AlbumDecorator)
    end
  end
end
