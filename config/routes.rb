Rails.application.routes.draw do
  devise_for :users, controllers: {
     sessions: 'users/sessions'
   }


  root to: "homepage#index"
  resources :homepage

  resources :users

  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      resources :locations do
        collection do
          post :yelp_api_search
        end
      end
    end
  end

end
