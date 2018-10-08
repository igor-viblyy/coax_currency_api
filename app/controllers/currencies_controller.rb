class CurrenciesController < ApplicationController
  before_action :set_user, only: %i[create destroy]

  # def index
    # @currencies = @user.currencies.all
    # render json: Currency.all
  # end

  def create
    # @currency = Currency.new(from: params[:from], to: params[:to])

    @currency = @user.currencies.build(from: params[:from], to: params[:to], user_id: params[:user])

    if @currency.save!
      render json: @currency, status: :created
      CurrencyCheckJob.perform_now(@currency.id)
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.currencies.destroy
    status :no_content
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end
end