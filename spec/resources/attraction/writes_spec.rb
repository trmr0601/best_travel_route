require "rails_helper"

RSpec.describe AttractionResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "attractions",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AttractionResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Attraction.count }.by(1)
    end
  end

  describe "updating" do
    let!(:attraction) { create(:attraction) }

    let(:payload) do
      {
        data: {
          id: attraction.id.to_s,
          type: "attractions",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AttractionResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { attraction.reload.updated_at }
      # .and change { attraction.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:attraction) { create(:attraction) }

    let(:instance) do
      AttractionResource.find(id: attraction.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Attraction.count }.by(-1)
    end
  end
end
