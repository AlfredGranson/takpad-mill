require 'rails_helper'

RSpec.describe "blocks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/blocks/#{block.id}"
  end

  describe 'basic destroy' do
    let!(:block) { create(:block) }

    it 'updates the resource' do
      expect(BlockResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Block.count }.by(-1)
      expect { block.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
