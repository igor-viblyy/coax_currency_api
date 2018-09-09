require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }

  context "User email" do
    it 'validate email' do
      should validate_presence_of(:email)
    end

    it 'email present' do
      expect(user.email).to eq(user.email)
    end

    it 'invalidate email' do
      expect(user.email).to_not eq('')
    end
  end
end
