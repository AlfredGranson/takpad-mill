require 'rails_helper'

RSpec.describe FolderResource, type: :resource do
  describe 'serialization' do
    let!(:folder) { create(:folder) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(folder.id)
      expect(data.jsonapi_type).to eq('folders')
    end
  end

  describe 'filtering' do
    let!(:folder1) { create(:folder) }
    let!(:folder2) { create(:folder) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: folder2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([folder2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:folder1) { create(:folder) }
      let!(:folder2) { create(:folder) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            folder1.id,
            folder2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            folder2.id,
            folder1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
