require 'rails_helper'

RSpec.describe AttractionResource, type: :resource do
  describe 'serialization' do
    let!(:attraction) { create(:attraction) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(attraction.id)
      expect(data.jsonapi_type).to eq('attractions')
    end
  end

  describe 'filtering' do
    let!(:attraction1) { create(:attraction) }
    let!(:attraction2) { create(:attraction) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: attraction2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([attraction2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:attraction1) { create(:attraction) }
      let!(:attraction2) { create(:attraction) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            attraction1.id,
            attraction2.id
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
            attraction2.id,
            attraction1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
