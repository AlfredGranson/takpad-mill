require 'rails_helper'

RSpec.describe "blocks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/blocks/#{block.id}", params: params
  end

  describe 'basic fetch' do
    let!(:block) { create(:block) }

    it 'works' do
      expect(BlockResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('blocks')
      expect(d.id).to eq(block.id)
    end
  end
end
