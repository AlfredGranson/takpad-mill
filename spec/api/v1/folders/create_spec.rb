require 'rails_helper'

RSpec.describe "folders#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/folders", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:folder)
    end
    let(:payload) do
      {
        data: {
          type: 'folders',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FolderResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Folder.count }.by(1)
    end
  end
end
