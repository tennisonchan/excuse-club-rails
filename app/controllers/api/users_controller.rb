class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.new(user_params.merge(password: Devise.friendly_token(20), confirmed_at: Time.zone.now))
    if @user.save
      render json: @user
    else
      render json: { error: @user.errors.full_messages.first }
    end
  end

  private

  def user_params
    params.permit(:name, :phone)
  end
end
