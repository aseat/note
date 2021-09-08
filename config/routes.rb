Rails.application.routes.draw do
  resources :articles do
    resources :tags
    resources :article_bodies
    collection do
      get  'article/:id'=>  'articles#purchase', as: 'article'
      post 'pay/:id'=>   'articles#pay', as: 'pay'
      get  'done'=>      'articles#done', as: 'done'
    end
  end
  devise_for :users
  root to: "articles#index"
end
