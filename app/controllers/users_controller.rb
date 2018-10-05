class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def show
    render json: @user
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
