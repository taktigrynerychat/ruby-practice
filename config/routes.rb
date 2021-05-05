Rails.application.routes.draw do
  resources :themes
  resources :images
  resources :values
  resources :users
  root 'main#index'
  get 'main/index'
  get 'main/help'
  get 'main/contacts'
  get 'main/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
