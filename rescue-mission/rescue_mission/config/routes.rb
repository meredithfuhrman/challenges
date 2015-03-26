Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'

  resources :questions

  resources :questions, except: [:update] do
    resources :answers, only: [:index, :new, :create]
  end

  resources :answers

end
