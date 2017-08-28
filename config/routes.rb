Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  

  get 'managers' , to: 'users#managers'
  get 'user_goals_index' , to: 'goal#user_goals_index'


  resources :users do 
  	resources :goals  do 
  	  resources :comments
    end
  end

  root to: 'users#index'
end
