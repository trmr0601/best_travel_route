require "rails_helper"

RSpec.describe "attractions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/attractions/#{attraction.id}"
  end

  describe "basic destroy" do
    let!(:attraction) { create(:attraction) }

    it "updates the resource" do
      expect(AttractionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Attraction.count }.by(-1)
      expect { attraction.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
