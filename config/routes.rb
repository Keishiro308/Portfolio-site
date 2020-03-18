Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'top#dash_board'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
    resources :portfolios, except: %i[show]
    resources :articles
  end
  namespace :visitor, path: '' do
    root 'top#index'
  end
end
