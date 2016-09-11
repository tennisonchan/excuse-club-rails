class DemoController < ApplicationController
  skip_before_action :authenticate_app!
  skip_before_action :authenticate_user!

  def index
  end
end
