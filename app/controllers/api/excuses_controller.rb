class Api::ExcusesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @excuse = Excuse.new(excuse_params)
    if @excuse.save
      render json: @excuse
    else
      render json: @excuse.errors
    end
  end

  private

  def excuse_params
    params.permit(:start_time, :end_time)
  end
end
