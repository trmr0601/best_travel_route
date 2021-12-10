require "rails_helper"

RSpec.describe Feedback, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:routes) }

    it { should belong_to(:users) }
  end

  describe "InDirect Associations" do
    it { should have_one(:attraction) }
  end

  describe "Validations" do
  end
end
