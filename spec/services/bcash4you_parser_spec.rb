require 'rails_helper'

RSpec.describe Bcash4youParser do
  describe '#perform' do
    let(:data) { file_fixture('bcash4you.csv').read }
    let!(:site) { FactoryGirl.create(:site, title: 'Watch4Beauty') }

    subject(:service) { described_class.new(data) }

    it 'creates new models' do
      expect { service.perform }.to change { Model.count }.by(2)
    end

    it 'creates new site models' do
      expect { service.perform }.to change { site.site_models.count }.by(2)
    end

    it 'creates new albums' do
      expect { service.perform }.to change { Album.count }.by(2)
    end

    it 'creates new site models' do
      expect { service.perform }.to change { AlbumModel.count }.by(2)
    end

    context 'on second attempt' do
      before do
        service.perform
      end

      it 'does not create new models' do
        expect { service.perform }.not_to(change { Model.count })
      end

      it 'does not create new site models' do
        expect { service.perform }.not_to(change { site.site_models.count })
      end

      it 'does not create new albums' do
        expect { service.perform }.not_to(change { Album.count })
      end

      it 'does not create new site models' do
        expect { service.perform }.not_to(change { AlbumModel.count })
      end
    end
  end
end
