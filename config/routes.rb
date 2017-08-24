Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :users do 
  	resources :goals
  end

  resources :goals do 
  	resources :comments
  end

  root to: 'users#index'
end
