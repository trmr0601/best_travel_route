require "rails_helper"

RSpec.describe "transportations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/transportations", params: params
  end

  describe "basic fetch" do
    let!(:transportation1) { create(:transportation) }
    let!(:transportation2) { create(:transportation) }

    it "works" do
      expect(TransportationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["transportations"])
      expect(d.map(&:id)).to match_array([transportation1.id,
                                          transportation2.id])
    end
  end
end
