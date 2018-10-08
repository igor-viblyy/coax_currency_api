class BaseController < ApplicationController
  def index
    request = AmdorenConnectionService.call(from: 'USD', to: 'UAH')

    render json: request.body
  end

end
