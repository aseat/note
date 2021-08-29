Rails.application.routes.draw do
  resources :addresses
  resources :articles do
    resources :tags
    resources :article_bodies
  end
  devise_for :users
  root to: "articles#index"
end
