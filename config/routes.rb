Rails.application.routes.draw do
  resources :labels
  root 'tasks#index'
  resources :sessions
  namespace :admin do
    resources :users
  end
  resources :tasks
end
