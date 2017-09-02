require 'rails_helper'

RSpec.describe BellaCashParser do
  describe '#perform' do
    let(:data) { file_fixture('bellacash.csv').read }

    subject(:service) { described_class.new(data) }

    it 'creates new sites' do
      expect { service.perform }.to change { Site.count }.by(2)
    end

    it 'creates new models' do
      expect { service.perform }.to change { Model.count }.by(2)
    end

    it 'creates new site models' do
      expect { service.perform }.to change { SiteModel.count }.by(2)
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

      it 'does not create new sites' do
        expect { service.perform }.not_to(change { Site.count })
      end

      it 'does not create new models' do
        expect { service.perform }.not_to(change { Model.count })
      end

      it 'does not create new site models' do
        expect { service.perform }.not_to(change { SiteModel.count })
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
