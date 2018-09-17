class CurrenciesController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  before_action :set_currency, only: %i[destroy]


  def create
    @currency = @user.currencies.build(from: params[:from], to: params[:to], user_id: params[:user])

    if @currency.save!
      render json: @currency, status: :created
      # CurrencyCheckJob.perform_now(@currency.id)
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.currencies.destroy
    head :no_content
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_currency
      @currency = Currency.find(params[:id])
    end
end
