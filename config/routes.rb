Signup::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :home, only: [:index]
  resources :dashboard, only: [:index]
  resources :users, only: [:create]

  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get 'sign_in', to: 'home#index', as: 'sign_in'

  root to: 'home#index'
end
