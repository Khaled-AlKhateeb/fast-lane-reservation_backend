Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :users
        resources :vehicles do
          resources :reservations
        end
    end
  end
end
