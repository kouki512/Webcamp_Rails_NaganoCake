Rails.application.routes.draw do
  
  
  namespace :admin do
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'
    resources :customers ,only:[:index,:show,:edit,:update]
  end
    devise_for(
        :admins,
        path: 'admin',
        module: 'admin'
    )
  namespace :admin do
    get '/' => 'homes#top'
  end
  
  
  
  scope module: :public do
    
    # devise_for :end_users,controllers:{
    #   # registrations: 'end_users/registrations',
    #   # sessions: 'end_users/sessions'
      
    # }
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
    
    
   
    
    root to: 'homes#top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
