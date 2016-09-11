Rails.application.routes.draw do
  namespace :api do
    resources :users, only: %i(create)
    resources :buddies, only: %i(index create)
    resources :excuses, only: %i(create)
    resources :begs, only: %i(index show) do
      member do
        post :bro
      end
    end
  end

  root to: 'home#index'

  get 'demo', to: 'demo#index'
end
