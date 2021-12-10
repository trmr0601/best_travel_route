require 'rails_helper'

RSpec.describe "attractions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attractions", params: params
  end

  describe 'basic fetch' do
    let!(:attraction1) { create(:attraction) }
    let!(:attraction2) { create(:attraction) }

    it 'works' do
      expect(AttractionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['attractions'])
      expect(d.map(&:id)).to match_array([attraction1.id, attraction2.id])
    end
  end
end
