Rails.application.routes.draw do
  resources :category
  resources :products
  resources :order_items
  # scope 'account' do
  #   get 'dashboard'
  # end

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
