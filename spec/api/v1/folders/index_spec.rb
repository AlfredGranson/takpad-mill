require 'rails_helper'

RSpec.describe "folders#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/folders", params: params
  end

  describe 'basic fetch' do
    let!(:folder1) { create(:folder) }
    let!(:folder2) { create(:folder) }

    it 'works' do
      expect(FolderResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['folders'])
      expect(d.map(&:id)).to match_array([folder1.id, folder2.id])
    end
  end
end
