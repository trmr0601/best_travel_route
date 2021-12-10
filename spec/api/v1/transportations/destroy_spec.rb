require "rails_helper"

RSpec.describe "transportations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/transportations/#{transportation.id}"
  end

  describe "basic destroy" do
    let!(:transportation) { create(:transportation) }

    it "updates the resource" do
      expect(TransportationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Transportation.count }.by(-1)
      expect { transportation.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
