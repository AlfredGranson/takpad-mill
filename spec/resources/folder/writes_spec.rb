require 'rails_helper'

RSpec.describe FolderResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'folders',
          attributes: attributes_for(:folder)
        }
      }
    end

    let(:instance) do
      FolderResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Folder.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:folder) { create(:folder) }

    let(:payload) do
      {
        data: {
          id: folder.id.to_s,
          type: 'folders',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FolderResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { folder.reload.updated_at }
      # .and change { folder.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:folder) { create(:folder) }

    let(:instance) do
      FolderResource.find(id: folder.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Folder.count }.by(-1)
    end
  end
end
