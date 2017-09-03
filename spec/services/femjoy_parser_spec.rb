require 'rails_helper'

RSpec.describe FemjoyParser do
  describe '#perform' do
    let(:site) { FactoryGirl.create :site }
    # Data taken from:
    # http://cash.femjoy.com/export/c1/galleries/2/
    #   models,title,url,artist,archive,date,thumb/[]/json/
    #   %7B%22s%22:%22date-desc%22,
    #   %22r%22:%7B%22galleries%22:%7B%22s%22:%22cover2_384x384%22%7D%7D%7D/
    #   2588917
    let(:data) { file_fixture('femjoy.json').read }

    subject(:service) do
      described_class.new(site, data)
    end

    it 'creates new models' do
      expect { service.perform }.to change { Model.count }.by(3)
    end

    it 'creates new site models' do
      expect { service.perform }.to change { site.site_models.count }.by(3)
    end

    it 'creates new site albums' do
      expect { service.perform }.to change { site.albums.count }.by(2)
    end

    it 'creates new album models' do
      expect { service.perform }.to change { AlbumModel.count }.by(3)
    end

    it 'creates new artists' do
      expect { service.perform }.to change { Artist.count }.by(2)
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

      it 'does not create new site albums' do
        expect { service.perform }.not_to(change { site.albums.count })
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
