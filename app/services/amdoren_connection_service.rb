require 'faraday'

class AmdorenConnectionService
  BASE_URL = "https://www.amdoren.com/api/currency.php?api_key=KHKnLD9Ui3XKUmfLwgAT5Qx3fkEWhS".freeze

  def self.call(*args)
    new(*args).call
  end

  def initialize(params = {})
    @from = params[:from]
    @to = params[:to]
    @url = params[:url] || BASE_URL
  end

  def call
    conn = Faraday.new(url: @url) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    request = conn.get do |req|
      req.params[:from] = @from
      req.params[:to] = @to
    end
  end
end
