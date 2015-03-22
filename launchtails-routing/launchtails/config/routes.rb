Rails.application.routes.draw do
  root 'featured_drinks#index'
  devise_for :users
  resources :drinks, only: [:index, :new, :create, :destroy]
  get '/featured-drinks', to: 'featured_drinks#index'
end
