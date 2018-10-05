require 'rails_helper'

RSpec.describe User, type: :model do
  context "User" do
    it { should have_many(:currencies).dependent(:destroy) }

    it 'validate email' do
      should validate_presence_of(:email)
    end
  end
end
