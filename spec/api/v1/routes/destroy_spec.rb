require 'rails_helper'

RSpec.describe "routes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/routes/#{route.id}"
  end

  describe 'basic destroy' do
    let!(:route) { create(:route) }

    it 'updates the resource' do
      expect(RouteResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Route.count }.by(-1)
      expect { route.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
