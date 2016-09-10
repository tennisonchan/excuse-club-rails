class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.new(user_params.merge(password: Devise.friendly_token(20)))
    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
