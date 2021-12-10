require 'rails_helper'

RSpec.describe RouteResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'routes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RouteResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Route.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:route) { create(:route) }

    let(:payload) do
      {
        data: {
          id: route.id.to_s,
          type: 'routes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RouteResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { route.reload.updated_at }
      # .and change { route.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:route) { create(:route) }

    let(:instance) do
      RouteResource.find(id: route.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Route.count }.by(-1)
    end
  end
end
