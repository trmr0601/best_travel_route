require "rails_helper"

RSpec.describe "feedbacks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedbacks", params: params
  end

  describe "basic fetch" do
    let!(:feedback1) { create(:feedback) }
    let!(:feedback2) { create(:feedback) }

    it "works" do
      expect(FeedbackResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["feedbacks"])
      expect(d.map(&:id)).to match_array([feedback1.id, feedback2.id])
    end
  end
end
