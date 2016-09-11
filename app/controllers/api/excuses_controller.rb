class Api::ExcusesController < ApplicationController
  before_action :set_excuse, only: %i(bro)

  def create
    @excuse = current_user.excuses.build(excuse_params)
    if @excuse.save
      render json: @excuse
    else
      render json: { error: @excuse.errors.full_messages.first }
    end
  end

  def bro
    if @excuse.done?
      render status: 422, json: { error: 'Already accepted' }
    else
      @excuse.bro(by: current_user)
      render json: @excuse
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
