require 'rails_helper'

RSpec.describe Transportation, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:routes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
