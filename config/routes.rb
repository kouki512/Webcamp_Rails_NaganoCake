Rails.application.routes.draw do
  
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
      devise_for(
        :end_users,
        path: 'customers',
        module: 'public/end_users'
        )
    
    # devise_scope :end_users do
    #   get 'customers/sign_in' => 'end_users/sessions#new'
    #   get 'customers/sign_up' => 'end_users/registrations#new'
    # end
    
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/quit' => 'customers#quit'
    
    root to: 'homes#top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
