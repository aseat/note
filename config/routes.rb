Rails.application.routes.draw do
  resources :articles
  devise_for :users
  root to: "tweets#index"
  resources :tweets
end
