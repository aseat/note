Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  resources :addresses
  resources :articles
  devise_for :users
  root to: "articles#index"
end
