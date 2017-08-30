Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  

  get 'managers' , to: 'users#managers'
  delete 'destroy_select_user', to: 'users#destroy_select_user'
  

  # resources :users
  # resources :goals
  # resources :comments

  resources :users do 
  	resources :goals  do 
  	  resources :comments
    end
  end

  root to: 'users#index'

  # For routing on devise
   # as :user do
   #   get 'signin', to: 'devise/sessions#new', as: :new_user_session
   #   post 'signin', to: 'devise/sessions#create', as: :user_session
   #   delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
   # end
end
