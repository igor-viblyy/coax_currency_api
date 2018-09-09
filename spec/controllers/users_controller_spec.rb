require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # before do
  #   get :show, id: user.id
  # end

  let(:user) { FactoryBot.create(:user) }

  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end

  # it "response with JSON body containing expected Article attributes" do
  #   hash_body = nil
  #
  #   expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
  # end
end
