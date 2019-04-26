Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  resources :users, only: [:create, :show]
end
