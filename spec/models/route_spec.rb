require "rails_helper"

RSpec.describe Route, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:transportations) }

    it { should have_many(:attractions) }

    it { should have_many(:feedbacks) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
