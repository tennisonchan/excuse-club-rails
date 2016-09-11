class Api::BegsController < ApplicationController
  before_action :set_beg, only: %i(show bro)

  def index
    @begs = current_user.begs
    render json: @begs, root: 'begs'
  end

  def show
    render json: @beg, root: 'beg'
  end

  def bro
    if @beg.done?
      render status: 422, json: { error: 'Already accepted' }
    else
      @beg.bro(by: current_user)
      render json: @beg, root: 'beg'
    end
  end

  private

  def set_beg
    @beg = Excuse.find(params[:id])
  end
end
