class HomeController < ApplicationController
  skip_before_action :authenticate_app!
  skip_before_action :authenticate_user!

  http_basic_authenticate_with name: 'excuse', password: 'club'

  def index
  end
end
