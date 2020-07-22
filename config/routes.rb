Rails.application.routes.draw do
  get 'ticket_sessions/new'
  get 'tickets', to: 'tickets#index'
  post 'create', to: 'tickets#create'
  post 'history_create', to: 'histories#create'
  get 'users/new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'static_pages#home'
  post 'status_create', to: 'ticket_statuses#create'
  post 'category_create', to: 'ticket_categories#create'

  resources :ticket_statuses
  resources :ticket_categories
  resources :tickets
  resources :ticket_activations, only: [:edit]
  resources :histories, only: [:edit, :destroy]
end
