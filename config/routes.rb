Rails.application.routes.draw do
  
  
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
    devise_for(
        :admins,
        path: 'admin',
        module: 'admin'
    )
    
  namespace :admin do
    resources :customers ,only:[:index,:show,:edit,:update]
    resources :items
    resources :genres ,only:[:index,:create,:edit,:update]
    get '/' => 'homes#top'
    
    get "orders" => "orders#index", as: :orders
    get "orders/:id" => "orders#show", as: :order
    patch "orders/:id" => "orders#update"
    # order_details
    patch "order_details/:id" => "order_details#update",as: :order_detail
  end
  
  
  scope module: :public do
      # addresses
      resources :addresses
      # customers
      get 'customers' => 'customers#show'
      get 'customers/edit' => 'customers#edit'
      patch 'customers' => 'customers#update'
      get 'customers/confirm' => 'customers#confirm'
      patch 'customers/quit' => 'customers#quit'
      
      devise_for(
        :end_users,
        path: 'customers',
        module: 'public/end_users'
        )
      # items
      get 'items' => 'items#index'
      get 'items/:id' => 'items#show', as: :item
      
      # cart_items
      resources :cart_items ,only:[:index,:update,:destroy,:create]
      get 'cart_items/destroy_all' => 'cart_items#destroy_all'
      
      #orders
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/decision' => 'orders#decision'
      resources :orders ,only:[:index,:show,:create,:new]
    root to: 'homes#top' 
  end
end
