class CurrencyCheckJob < ApplicationJob
  queue_as :default

  def perform(currency_id)
    @currency = Currency.find_by(id: currency_id)

    request = AmdorenConnectionService.call(from: @currency.from, to: @currency.to)
    # render json: request.body
    # puts @currency.from
  end
end
