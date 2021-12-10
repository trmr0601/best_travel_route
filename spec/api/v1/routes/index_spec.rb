require "rails_helper"

RSpec.describe "routes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/routes", params: params
  end

  describe "basic fetch" do
    let!(:route1) { create(:route) }
    let!(:route2) { create(:route) }

    it "works" do
      expect(RouteResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["routes"])
      expect(d.map(&:id)).to match_array([route1.id, route2.id])
    end
  end
end
