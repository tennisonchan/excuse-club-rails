class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.where(phone: user_params[:phone]).first_or_create(user_params.merge(password: Devise.friendly_token(20), confirmed_at: Time.zone.now))
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :phone)
  end
end
