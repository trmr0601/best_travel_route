require 'rails_helper'

RSpec.describe Attraction, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:routes) }

    end

    describe "InDirect Associations" do

    it { should have_one(:feedback) }

    end

    describe "Validations" do

    end
end
