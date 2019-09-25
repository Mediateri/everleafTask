Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
