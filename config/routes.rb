Rails.application.routes.draw do
  devise_for :users, controllers: {
     sessions: 'users/sessions'
   }


  root to: "homepage#index"
  resources :homepage

  resources :users

  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
