require "rails_helper"

RSpec.describe "attractions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attractions/#{attraction.id}", params: params
  end

  describe "basic fetch" do
    let!(:attraction) { create(:attraction) }

    it "works" do
      expect(AttractionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("attractions")
      expect(d.id).to eq(attraction.id)
    end
  end
end
