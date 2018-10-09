require 'rails_helper'

RSpec.describe "Currency API", type: :request do
  let!(:users) { create_list(:user, 10) }
  # let!(:currencies) { create_list(:currency, 2) }

  describe "POST /currncies" do
    let(:valid_attributes) { { from: "UAH", to: "USD" } }
    let(:invalid_attributes) { { from: nil, to: nil } }

    context "when the request is valid" do
      before { post "/users/#{users.first.id}/currencies", params: valid_attributes }

      it "create currencies" do
        expect(json['from']).to eq("UAH")
        expect(json['to']).to eq("USD")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/users/#{users.last.id}/currencies", params: invalid_attributes }

      it "return status 422" do
        expect(response).to have_http_status(200)
      end
    end
  end
  # describe "DELETE /currency/:id" do
  #   before { delete "/users/#{users.first.id}/currencies/#{currency_id}" }

  #   it "return status 204" do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
