Rails.application.routes.draw do
  get 'tickets', to: 'tickets#index'
  post 'create', to: 'tickets#create'
  get 'users/new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'static_pages#home'

  resources :ticket_activations, only: [:edit]
end
