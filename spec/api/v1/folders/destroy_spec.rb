require 'rails_helper'

RSpec.describe "folders#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/folders/#{folder.id}"
  end

  describe 'basic destroy' do
    let!(:folder) { create(:folder) }

    it 'updates the resource' do
      expect(FolderResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Folder.count }.by(-1)
      expect { folder.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
