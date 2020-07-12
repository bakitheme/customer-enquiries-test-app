Rails.application.routes.draw do
  get 'tickets', to: 'tickets#index'
  post 'create_ticket', to: 'tickets#create'
  get 'users/new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
