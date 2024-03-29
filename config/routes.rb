Signup::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :home, only: [:index]
  resources :dashboard, only: [:index]
  resources :users, only: [:new, :create]

  resources :forms do
    get 'basic_info', on: :collection
    get 'basic_info'
    get 'slots'
    patch 'update_slots'
    get 'fields'
    patch 'update_fields'
    get 'people'
    patch 'update_people'
    get 'preview'
    patch 'update_preview'
    get 'published'
    patch 'send_invites'
    get 'account'
    patch 'update_account'
    resources :admin, only: :index
  end

  resources :slots, only: [:create, :destroy]
  resources :fields, only: [:create, :destroy]
  resources :signups, only: [:show, :create]
  resources :users, only: [:show]

  get 'signups/:id/new(/:slot_id)', to: 'signups#new', as: 'new_signup'

  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'how-it-works', to: 'home#how_it_works', as: 'how_it_works'

  root to: 'home#index'
end
