Rails.application.routes.draw do
  # get 'welcome/index'
  root 'events#index'
  resources :users
  resources :events
  resources :sessions
  resources :attendances
end