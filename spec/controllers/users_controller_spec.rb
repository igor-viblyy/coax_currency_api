require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  # before do
  #   get :show, user: user.id
  # end

  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end
end
