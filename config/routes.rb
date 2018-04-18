Rails.application.routes.draw do
  devise_for :staff_members
  resources :books
  resources :categories
  resources :admins
  resources :libraries

  root to: "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
