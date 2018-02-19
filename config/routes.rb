Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope "(:locale)", locale: /en|ru/ do
    devise_for :customers, skip: :omniauth_callbacks
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
    post 'addresses', to: 'addresses#create'
    root to: 'books#home', as: "home"
  end
  devise_for :customers, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'customers/omniauth_callbacks'}
end
