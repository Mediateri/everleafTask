Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions
  namespace :admin do
    resources :users
  end
  resources :tasks
end
