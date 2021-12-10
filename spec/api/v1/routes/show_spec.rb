require "rails_helper"

RSpec.describe "routes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/routes/#{route.id}", params: params
  end

  describe "basic fetch" do
    let!(:route) { create(:route) }

    it "works" do
      expect(RouteResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("routes")
      expect(d.id).to eq(route.id)
    end
  end
end
