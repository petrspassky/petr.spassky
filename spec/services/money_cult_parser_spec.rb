require 'rails_helper'

RSpec.describe MoneyCultParser do
  describe '#perform' do
    let!(:site1) { FactoryGirl.create :site, title: 'Amour Angels' }
    let!(:site2) { FactoryGirl.create :site, title: 'Showy Beauty' }
    let!(:site3) { FactoryGirl.create :site, title: 'Teen Art Club' }

    let(:data) { file_fixture('money_cult.csv').read }

    subject(:service) do
      described_class.new(data)
    end

    it 'creates new models' do
      expect { service.perform }.to change { Model.count }.by(3)
    end

    describe 'creates new site models for each site' do
      it do
        expect { service.perform }.to change { site1.site_models.count }.by(1)
      end
      it do
        expect { service.perform }.to change { site2.site_models.count }.by(1)
      end
      it do
        expect { service.perform }.to change { site3.site_models.count }.by(1)
      end
    end

    describe 'creates new site albums for each site' do
      it do
        expect { service.perform }.to change { site1.albums.count }.by(1)
      end
      it do
        expect { service.perform }.to change { site2.albums.count }.by(1)
      end
      it do
        expect { service.perform }.to change { site3.albums.count }.by(1)
      end
    end

    it 'creates new album models' do
      expect { service.perform }.to change { AlbumModel.count }.by(3)
    end

    it 'creates new artists' do
      expect { service.perform }.to change { Artist.count }.by(1)
    end

    context 'on second attempt' do
      before do
        service.perform
      end

      it 'does not create new models' do
        expect { service.perform }.not_to(change { Model.count })
      end

      it 'does not create new site models' do
        expect { service.perform }.not_to(change { SiteModel.count })
      end

      it 'does not create new site albums' do
        expect { service.perform }.not_to(change { Album.count })
      end

      it 'does not create new album models' do
        expect { service.perform }.not_to(change { AlbumModel.count })
      end

      it 'does not create new artists' do
        expect { service.perform }.not_to(change { Artist.count })
      end
    end
  end
end
