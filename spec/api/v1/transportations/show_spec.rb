require "rails_helper"

RSpec.describe "transportations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/transportations/#{transportation.id}", params: params
  end

  describe "basic fetch" do
    let!(:transportation) { create(:transportation) }

    it "works" do
      expect(TransportationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("transportations")
      expect(d.id).to eq(transportation.id)
    end
  end
end
