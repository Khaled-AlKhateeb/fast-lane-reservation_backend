Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
        resources :vehicles, only: [:create, :index, :show, :update, :destroy] do
          resources :reservations
        end
        post "user/login", to: 'users#login'
      
    end
  end
end
