Rails.application.routes.draw do
  
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
  end
  
  
  scope module: :public do
    
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
      
      
    root to: 'homes#top'
  end
end
