Rails.application.routes.draw do
  namespace :api do
    resources :excuses, only: %i(create)
  end
end
