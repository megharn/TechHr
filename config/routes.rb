Rails.application.routes.draw do
 
  
  root to: 'home#index'
  devise_for :users, skip: [:registrations]
  as :user do
  	get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
  	put 'users' => 'devise/registrations#update', :as => 'user_registration'            
	end
#, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users do
    get :before_log_out, on: :member
  end 
  resources :projects
  resources :tasks do
    get :complete_task
    get :hold_task
    get :open_task
  end
  resources :comments 
  resources :task_reasons
  resources :reports
  resources :user_logs do
    post :after_login
  end

  

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
