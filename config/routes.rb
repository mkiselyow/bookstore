Rails.application.routes.draw do
  devise_for :customers
  # resources :address, 
  #           :author, 
  #           :billing_address, 
  #           :category, 
  #           :country, 
  #           :credit_card, 
  #           :customer,  
  #           :order_item, 
  #           :rating, 
  #           :shipping_address
  resources :books, only: %i(index show)
  resources :orders, only: %i(index show new)
  get 'book_by_title/:title', to: 'books#show', as: "book_by_title"
  root to: 'books#home', as: "home"
end
