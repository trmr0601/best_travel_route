require 'rails_helper'

RSpec.describe TransportationResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'transportations',
          attributes: { }
        }
      }
    end

    let(:instance) do
      TransportationResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Transportation.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:transportation) { create(:transportation) }

    let(:payload) do
      {
        data: {
          id: transportation.id.to_s,
          type: 'transportations',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      TransportationResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { transportation.reload.updated_at }
      # .and change { transportation.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:transportation) { create(:transportation) }

    let(:instance) do
      TransportationResource.find(id: transportation.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Transportation.count }.by(-1)
    end
  end
end
