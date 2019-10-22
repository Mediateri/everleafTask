Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tasks
end
