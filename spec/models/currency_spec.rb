require 'rails_helper'

RSpec.describe Currency, type: :model do
  context "Currency" do
    it "belongs_to" do
      should belong_to(:user)
    end

    it "validate currency :from, :to" do
      should validate_presence_of(:from)
      should validate_presence_of(:to)
    end
  end
end
