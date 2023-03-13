Rails.application.routes.draw do
  devise_for :users
  resources :category
  resources :products
  resources :order_items
  post '/products/ajax_favourite/:id', to: 'products#favourite'
  # scope 'account' do
  #   get 'dashboard'
  # end

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
