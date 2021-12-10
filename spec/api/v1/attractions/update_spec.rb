require 'rails_helper'

RSpec.describe "attractions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/attractions/#{attraction.id}", payload
  end

  describe 'basic update' do
    let!(:attraction) { create(:attraction) }

    let(:payload) do
      {
        data: {
          id: attraction.id.to_s,
          type: 'attractions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AttractionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { attraction.reload.attributes }
    end
  end
end
