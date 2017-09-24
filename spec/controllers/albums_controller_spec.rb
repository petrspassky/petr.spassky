require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe 'GET /index' do
    context 'without scope' do
      before do
        get :index
      end

      it { expect(response).to be_success }
    end

    context 'with model scope' do
      let(:model) { FactoryGirl.create(:model) }

      before do
        get :index, params: { model_id: model.id }
      end

      it { expect(response).to be_success }
    end

    context 'with site scope' do
      let(:site) { FactoryGirl.create(:site) }

      before do
        get :index, params: { site_id: site.id }
      end

      it { expect(response).to be_success }
    end
  end
end
