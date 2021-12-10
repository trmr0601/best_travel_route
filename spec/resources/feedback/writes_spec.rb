require "rails_helper"

RSpec.describe FeedbackResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "feedbacks",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FeedbackResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Feedback.count }.by(1)
    end
  end

  describe "updating" do
    let!(:feedback) { create(:feedback) }

    let(:payload) do
      {
        data: {
          id: feedback.id.to_s,
          type: "feedbacks",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FeedbackResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { feedback.reload.updated_at }
      # .and change { feedback.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:feedback) { create(:feedback) }

    let(:instance) do
      FeedbackResource.find(id: feedback.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Feedback.count }.by(-1)
    end
  end
end
