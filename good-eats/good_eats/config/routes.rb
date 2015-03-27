Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants, except: [:edit, :update, :destroy]

  resources :restaurants do
    resources :reviews
  end
end
