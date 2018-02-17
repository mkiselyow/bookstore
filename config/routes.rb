Rails.application.routes.draw do
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
  resources :books, only: [:index, :show]
  resources :orders, only: [:index, :show, :new]
  get 'book_by_title/:title', to: 'books#show', as: "book_by_title"
  get 'home', to: 'books#home', as: "home"
  root 'books#home'
end
