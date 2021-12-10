require 'rails_helper'

RSpec.describe "routes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/routes/#{route.id}", payload
  end

  describe 'basic update' do
    let!(:route) { create(:route) }

    let(:payload) do
      {
        data: {
          id: route.id.to_s,
          type: 'routes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RouteResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { route.reload.attributes }
    end
  end
end
