require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  describe "GET /users/:id" do
    before { get "/users/#{user_id}" }

    context "when the record exists" do
      it "returns user" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end

      it "returns status 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record not exists" do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(200)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
