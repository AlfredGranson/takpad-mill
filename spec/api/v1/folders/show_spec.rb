require 'rails_helper'

RSpec.describe "folders#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/folders/#{folder.id}", params: params
  end

  describe 'basic fetch' do
    let!(:folder) { create(:folder) }

    it 'works' do
      expect(FolderResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('folders')
      expect(d.id).to eq(folder.id)
    end
  end
end
