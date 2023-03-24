Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      get 'current_user/index', as: 'current_user'
        resources :reservations
        resources :vehicles, only: [:create, :index, :show, :update, :destroy]
        # end
        post "user/login", to: 'users#login'
      
    end
  end
end
