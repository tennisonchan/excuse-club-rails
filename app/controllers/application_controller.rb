class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :authenticate_app!
  before_action :authenticate_user!

  protected

  def authenticate_app!
    unless params[:api_key] == "secret"
      render status: 403, json: { error: "API error" }
    end
  end

  def authenticate_user!
    unless @current_user = User.find_by(token: params[:token])
      render status: 403, json: { error: "Auth error" }
    end
  end

  def current_user
    @current_user
  end
end
