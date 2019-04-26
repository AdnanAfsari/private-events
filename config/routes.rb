Rails.application.routes.draw do
  root 'events#index'

  get  '/signup',  to: 'users#new'
  resources :users, only: [:create, :show]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :events, only: [:new, :create, :show, :index]
  resources :invitations, only: [:create, :update, :destroy]


end
