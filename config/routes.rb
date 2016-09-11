Rails.application.routes.draw do
  namespace :api do
    resources :users, only: %i(create)
    resources :excuses, only: %i(create)
  end

  root to: 'home#index'
end
