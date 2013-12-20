Signup::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :home, only: [:index]
  resources :dashboard, only: [:index]
  resources :users, only: [:new, :create]

  resources :signups do
    get 'basic-info', to: 'signups#basic_info'
    get 'slots'
    get 'form-fields', to: 'signups#form_fields'
    get 'people'
  end

  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'how-it-works', to: 'home#how_it_works', as: 'how_it_works'

  root to: 'home#index'
end
