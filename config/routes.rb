Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions
  namespace :admin do
    resources :users
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tasks
end
