Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope "(:locale)", locale: /en|ru/ do
    devise_for :customer, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations'
      }, skip: :omniauth_callbacks
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
    devise_scope :customers do
      delete 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_customer_session
    end
    resources :books, only: %i(index show)
    resources :orders, only: %i(index show new)
    get 'book_by_title/:title', to: 'books#show', as: "book_by_title"
    post 'addresses', to: 'addresses#create'
    post 'order_items', to: 'order_items#create', as: "add_to_cart"
    post 'orders/clear', to: 'orders#clear', as: "clear_cart"
    root to: 'books#home', as: "home"
    get 'checkout/complete', to: 'checkouts#complete'
    get 'checkout/confirm', to: 'checkouts#confirm'
    get 'checkout/delivery', to: 'checkouts#delivery'
    get 'checkout/payment', to: 'checkouts#payment'
    get 'checkout/shipping_billing', to: 'checkouts#shipping_billing'
    get 'des/log_in', to: 'des#log_in'
    get 'des/new_password', to: 'des#new_password'
    get 'des/password', to: 'des#password'
    get 'des/settings', to: 'des#settings'
    post '/books', to: 'books#index'
  end
  devise_for :customers, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'customers/omniauth_callbacks'}
end
