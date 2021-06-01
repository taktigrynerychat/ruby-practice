Rails.application.routes.draw do
  resources :themes
  resources :images
  resources :values
  resources :users
  resources :sessions

  root 'main#index'
  get 'main/index'
  get 'main/help'
  get 'main/contacts'
  get 'main/about'

  match 'work', to: 'work#index',via: 'get'
  match 'choose_image',     to: 'work#choose_image',      via: :get
  match 'choose_theme', to: 'work#choose_theme', via: :get
  match 'rate', to: 'work#rate', via: :get
  match 'display_theme', to: 'work#display_theme', via: :post, as: :js
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    match 'next_image', to: 'api#next_image', via: :get
    match 'prev_image', to: 'api#prev_image', via: :get
  end

  match 'signup',   to: 'users#new',            via: 'get'
  match 'signin',   to: 'sessions#new',         via: 'get'
  match 'signout',  to: 'sessions#destroy',     via: 'delete'

end
