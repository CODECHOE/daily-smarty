Rails.application.routes.draw do
  get 'query', to: 'search#query', as: 'search_query'

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :topics, only: [:index, :show]
  get 'topic-autocomplete', to: 'topics#autocomplete'
  devise_for :users
  get 'smarties', to: 'users#index', as: 'smarties'
  get 'popular', to: 'static#popular', as: 'popular'
  get 'follow/:following_id', to: 'users#follow_toggle', as: 'follow_toggle'
  get ':id', to: 'static#profile', as: 'profile'
  root to: 'static#homepage'
end
