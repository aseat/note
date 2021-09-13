Rails.application.routes.draw do
  resources :articles do
    resources :tags
    resources :article_bodies
    post :pay, on: :member
  end
  

  devise_for :users
  root to: "articles#index"
end
