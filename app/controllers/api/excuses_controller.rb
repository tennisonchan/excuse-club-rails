class Api::ExcusesController < ApplicationController
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
