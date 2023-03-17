require 'rails_helper'

RSpec.describe "blocks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/blocks", params: params
  end

  describe 'basic fetch' do
    let!(:block1) { create(:block) }
    let!(:block2) { create(:block) }

    it 'works' do
      expect(BlockResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['blocks'])
      expect(d.map(&:id)).to match_array([block1.id, block2.id])
    end
  end
end
