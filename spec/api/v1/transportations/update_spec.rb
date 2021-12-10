require 'rails_helper'

RSpec.describe "transportations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/transportations/#{transportation.id}", payload
  end

  describe 'basic update' do
    let!(:transportation) { create(:transportation) }

    let(:payload) do
      {
        data: {
          id: transportation.id.to_s,
          type: 'transportations',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TransportationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { transportation.reload.attributes }
    end
  end
end
