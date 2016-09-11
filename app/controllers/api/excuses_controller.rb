class Api::ExcusesController < ApplicationController
  before_action :set_excuse, only: %i(bro)

  def create
    @excuse = current_user.excuses.build(excuse_params)
    if @excuse.save
      if params[:buddies].present?
        params[:buddies].each do |buddy|
          user = User.where(phone: buddy[:phone]).first_or_create!(name: buddy[:name], password: Devise.friendly_token(20))
          @excuse.beggings << user
        end
      end
      render json: @excuse
    else
      render json: { error: @excuse.errors.full_messages.first }
    end
  end

  private

  def set_excuse
    @excuse = Excuse.find(params[:id])
  end

  def excuse_params
    params.permit(:start_time, :end_time)
  end
end
