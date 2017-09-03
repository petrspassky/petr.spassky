require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  describe 'GET /index' do
    before do
      get :index
    end

    it { expect(response).to be_success }
  end
end
