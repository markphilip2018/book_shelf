Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :staff_members
  resources :books
  resources :categories
  resources :admins
  resources :libraries


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create' , as: 'create_session'
  delete '/logout',  to: 'sessions#destroy'


  root to: "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
