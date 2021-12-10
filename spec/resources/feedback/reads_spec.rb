require "rails_helper"

RSpec.describe FeedbackResource, type: :resource do
  describe "serialization" do
    let!(:feedback) { create(:feedback) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(feedback.id)
      expect(data.jsonapi_type).to eq("feedbacks")
    end
  end

  describe "filtering" do
    let!(:feedback1) { create(:feedback) }
    let!(:feedback2) { create(:feedback) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: feedback2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([feedback2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:feedback1) { create(:feedback) }
      let!(:feedback2) { create(:feedback) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      feedback1.id,
                                      feedback2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      feedback2.id,
                                      feedback1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
