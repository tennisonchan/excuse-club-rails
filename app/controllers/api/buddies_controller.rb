class Api::BuddiesController < ApplicationController
  def index
    @buddies = current_user.buddies
    render json: @buddies, root: 'buddies', each_serializer: BuddySerializer
  end

  def create
    params[:buddies].each do |buddy|
      user = User.where(email: buddy[:email]).first_or_create!(name: buddy[:name], password: Devise.friendly_token(20))
      unless current_user.buddies.include?(user) || current_user == user
        current_user.buddies << user
      end
    end

    render json: current_user.buddies, root: 'buddies', each_serializer: BuddySerializer
  end
end
