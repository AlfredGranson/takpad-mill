require 'rails_helper'

RSpec.describe "blocks#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/blocks", payload
  end

  describe 'basic create' do
    let!(:page) { create :page }

    let(:params) do
      attributes_for(:block)
    end
    let(:payload) do
      {
        data: {
          type: 'blocks',
          attributes: params,
          relationships: {
            page: {
              data: {
                id: page.id,
                type: "pages"
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(BlockResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Block.count }.by(1)
    end
  end
end
