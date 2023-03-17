require 'rails_helper'

RSpec.describe BlockResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'blocks',
          attributes: attributes_for(:block)
        }
      }
    end

    let(:instance) do
      BlockResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Block.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:block) { create(:block) }

    let(:payload) do
      {
        data: {
          id: block.id.to_s,
          type: 'blocks',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BlockResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { block.reload.updated_at }
      # .and change { block.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:block) { create(:block) }

    let(:instance) do
      BlockResource.find(id: block.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Block.count }.by(-1)
    end
  end
end
