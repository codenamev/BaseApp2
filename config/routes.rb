Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "user_sessions" },
    path_names:{ sign_in: 'login', sign_out: 'logout',  registration: 'register' }

  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :profiles

  resources :users do
     member do
       get :edit_password 
       get :set_login
       put :update_login
       put :update_password
       get :edit_email
       put :update_email
       get :edit_avatar
       put :update_avatar
    end
  end

  resources :announcements
  
  # RESTful rewrites
  
  get '/opensession' => "sessions#create", :as => "open_id_complete"
  get '/opencreate' => 'users#create',:as => :open_id_create
    
  
  # Administration
  namespace :admin do 
    root :to => 'dashboard#index'
    resources :settings 
    post '/settings/update_settings' => 'settings#update_settings'
    resources :announcements
    resources :commits
    resources :delayed_jobs, :only => [:index]
    get '/users/search' => 'users#search'
    resources :users do 
      member do 
        put :suspend
        put :unsuspend
        put :activate
        delete :purge
        put :reset_password
        get :set_user_login
        get :set_user_email        
        get 'role/:role' => "users#toggle_role", :as => "toggle_role"
      end
      collection do
        get :pending
        get :active
        get :suspended
        get :deleted
      end
    end
  end
  
  get '/auth/:provider/callback' => 'authentications#create', :as => :auth_callback
  resources :authentications
  
  root :to => "dashboard#index"
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
