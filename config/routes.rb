Rails.application.routes.draw do
  namespace :api do
    resources :users, only: %i(create)
    resources :excuses, only: %i(create) do
      member do
        post :bro
      end
    end
  end

  root to: 'home#index'
end
