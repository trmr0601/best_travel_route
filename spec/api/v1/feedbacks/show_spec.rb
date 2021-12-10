require "rails_helper"

RSpec.describe "feedbacks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedbacks/#{feedback.id}", params: params
  end

  describe "basic fetch" do
    let!(:feedback) { create(:feedback) }

    it "works" do
      expect(FeedbackResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("feedbacks")
      expect(d.id).to eq(feedback.id)
    end
  end
end
