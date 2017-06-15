Rails.application.routes.draw do
  resources :posts
  resources :topics, only: [:index, :show]
  devise_for :users
  get ':id', to: 'static#profile'
  root to: 'static#homepage'
end
