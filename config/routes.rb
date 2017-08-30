Rails.application.routes.draw do
  
  devise_for :members, controllers: {
        sessions: 'members/sessions'
      }
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

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

  ## For routing on devise
  # devise_for :users,  skip: [:sessions, :registrations]
   
end
