require "rails_helper"

RSpec.describe "feedbacks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/feedbacks/#{feedback.id}", payload
  end

  describe "basic update" do
    let!(:feedback) { create(:feedback) }

    let(:payload) do
      {
        data: {
          id: feedback.id.to_s,
          type: "feedbacks",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FeedbackResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { feedback.reload.attributes }
    end
  end
end
