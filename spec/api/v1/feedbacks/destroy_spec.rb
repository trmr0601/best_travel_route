require 'rails_helper'

RSpec.describe "feedbacks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/feedbacks/#{feedback.id}"
  end

  describe 'basic destroy' do
    let!(:feedback) { create(:feedback) }

    it 'updates the resource' do
      expect(FeedbackResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Feedback.count }.by(-1)
      expect { feedback.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
