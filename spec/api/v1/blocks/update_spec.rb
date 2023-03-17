require 'rails_helper'

RSpec.describe "blocks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/blocks/#{block.id}", payload
  end

  describe 'basic update' do
    let!(:block) { create(:block) }

    let(:payload) do
      {
        data: {
          id: block.id.to_s,
          type: 'blocks',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BlockResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { block.reload.attributes }
    end
  end
end
