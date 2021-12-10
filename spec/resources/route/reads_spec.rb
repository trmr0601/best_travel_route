require "rails_helper"

RSpec.describe RouteResource, type: :resource do
  describe "serialization" do
    let!(:route) { create(:route) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(route.id)
      expect(data.jsonapi_type).to eq("routes")
    end
  end

  describe "filtering" do
    let!(:route1) { create(:route) }
    let!(:route2) { create(:route) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: route2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([route2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:route1) { create(:route) }
      let!(:route2) { create(:route) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      route1.id,
                                      route2.id,
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
                                      route2.id,
                                      route1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
