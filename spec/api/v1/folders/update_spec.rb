require 'rails_helper'

RSpec.describe "folders#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/folders/#{folder.id}", payload
  end

  describe 'basic update' do
    let!(:folder) { create(:folder) }

    let(:payload) do
      {
        data: {
          id: folder.id.to_s,
          type: 'folders',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FolderResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { folder.reload.attributes }
    end
  end
end
