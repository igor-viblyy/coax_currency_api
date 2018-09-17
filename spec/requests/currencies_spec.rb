require 'rails_helper'

RSpec.describe "Currency API", type: :request do
  let!(:currencies) { create_list(:currency, 10) }
end
