Signup::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
end
