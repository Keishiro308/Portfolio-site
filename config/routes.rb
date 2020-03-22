Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'top#dash_board'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
    resources :portfolios, except: %i[show]
    resources :articles
    resources :users, only: %i[edit update]
    resources :article_images, only: %i[create destroy]
  end
  namespace :visitor, path: '' do
    root 'top#index'
    resources :portfolios, only: %i[index show]
    resources :articles, only: %i[show]
  end
end
